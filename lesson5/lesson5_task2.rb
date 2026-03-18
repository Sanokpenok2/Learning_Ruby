module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = ["Яблочки", "Сливы", "Груши"]
  end

  def index
    @posts.each_with_index do |element, i|
      puts "#{i}. #{element} \n"
    end
  end

  def show
    print "Введите индекс поста: "
    needed_index = gets.chomp.to_i
    @posts.each_with_index do |element, i|
      if needed_index == i
        puts "#{i}. #{element} \n"
        return
      end
    end

    puts "Нет поста с таким индексом"
  end

  def create
    print "Введите текст поста:"
    text = gets.chomp
    @posts << text
    puts "Добавлен пост с индексом #{@posts.length - 1}: <#{text}>"
  end

  def update
    print "Введите индекс поста: "
    needed_index = gets.chomp.to_i
    puts "Нет поста с таким индексом" if needed_index < 0 || needed_index > @posts.length - 1
    print "Введите новый текст поста:"
    text = gets.chomp
    @posts.each_index do | i|
      if needed_index == i
        @posts[i] = text
        puts "#{i}. #{@posts[i]} \n"
        return
      end
    end

    puts "Нет поста с таким индексом"
  end

  def destroy
    print "Введите индекс поста: "
    needed_index = gets.chomp.to_i

    puts "Нет поста с таким индексом" if needed_index < 0

    puts @posts.delete_at(needed_index).nil? ? "Нет поста с таким индексом" : "Удалено успешно"
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init

