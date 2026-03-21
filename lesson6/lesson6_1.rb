class User
  def print_name(name)
    if name == "John"
      puts "Hello, John!"
    elsif name == "Marry"
      puts "Hello, Marry!"
    else
      puts "Who are you?"
    end
  end

  private

  def divide(a, b)
    a / b
  end
end

