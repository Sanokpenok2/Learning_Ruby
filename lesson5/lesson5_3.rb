class Human
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def eat(food)
    chew(food)
    swallow(food)
    digest(food)
    puts "Nice"
  end

  private

  def chew(food); end
  def swallow(food); end
  def digest(food); end
end

