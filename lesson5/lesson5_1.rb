class User
  #attr_reader :name
  #attr_writer :name
  #attr_accessor :name
  def initialize(name)
    @name = name
  end

  def getName
    return @name
  end
end

user1 = User.new("John")
puts user1.getName

