module Resource
  def connection
    puts "Connected to a Database: #{self}"
  end
end

class PostsController
  extend Resource

  def show(id)
    puts "ID is #{id}"
  end
end

controller = PostsController.new
method = controller.method(:show)
method.call(1)

