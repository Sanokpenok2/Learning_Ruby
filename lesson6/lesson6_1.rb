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

  def say_my_name
    who = gets.chomp

    answer =
      if who == "Heisenberg"
        "You're goddamn right"
      else
        "What are say Pinkman!"
      end

    return answer

  end
end

