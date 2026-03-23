require 'socket'
require 'rack'
require 'rack/utils'

require_relative 'storage'
require_relative 'task'
require_relative 'task_list'

class App
  def initialize(storage)
    @storage = storage
    @task_list = storage.load
  end

  def call(env)
    puts "Received request: #{env['REQUEST_METHOD']} #{env['PATH_INFO']}"

    req = Rack::Request.new(env)

    case req.path
    when "/list_tasks"
      tasks = @task_list.to_json
      [200, {"Content-Type" => "text/json"}, [tasks]]
    when "/add_task"
      task_title = req.params["title"]
      task_id = @task_list.add_task(task_title)
      @storage.save(@task_list)
      [200, {"Content-Type" => "text/plain"}, ["Task ##{task_id} added!"]]
    when "/toggle_task"
      task_id = req.params["id"].to_i

      task_is_done = @task_list.toggle_task(task_id)

      return [404, {"Content-Type" => "text/html"}, ["Task ##{task_id} is not found!"]] if task_is_done.nil?

      @storage.save(@task_list)

      if task_is_done
        [200, {"Content-Type" => "text/plain"}, ["Task ##{task_id} is done!"]]
      else
        [200, {"Content-Type" => "text/plain"}, ["Task ##{task_id} is undone!"]]
      end
    else
      [404, {"Content-Type" => "text/plain"}, ["Bad Request"]]
    end
  end
end

server = TCPServer.open('localhost', 3000)

app = App.new(Storage.new("./HTTP-server/tasks.json"))

while connection = server.accept do
  request = connection.gets
  method, full_path = request.split(' ')
  path, query_string = full_path.split('?')

  params = Rack::Utils.parse_query(query_string)

  status, headers, body = app.call({
                                     "REQUEST_METHOD" => method,
                                     "PATH_INFO" => path,
                                   "QUERY_STRING" => query_string
                                   })

  connection.print "HTTP/1.1 #{status}\r\n"

  headers.each do |key, value|
    connection.print "#{key}: #{value}\r\n"
  end

  connection.print "\r\n"

  body.each { |part| connection.print part }

  connection.close
end

