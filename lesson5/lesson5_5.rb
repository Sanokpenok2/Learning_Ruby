module Resource
  def connection
    puts "Connected to a Database: #{self}"
  end
end

class PostsController
  include Resource
end

controller = PostsController.new
controller.connection

#include для добавления методов экземпляров класса
#extend для добавления методов класса

#Когда вы «включаете» модуль, он включается так, как если бы методы были определены в классе, который их «включает».
# Можно сказать, что методы копируются в класс, который их «включает».
#
# Когда вы «расширяете» модуль, вы говорите: «Добавьте методы этого модуля к этому конкретному экземпляру».