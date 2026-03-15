module Resource
  def connection
    puts "Connected to a Database: #{self}"
  end
end

class PostsController
  extend Resource
end

PostsController.connection
controller = PostsController.new
controller.connection

