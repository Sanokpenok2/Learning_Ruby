def greeting
  puts "Введите имя:"
  name = gets.chomp
  puts "Введите фамилию:"
  surname = gets.chomp
  puts "Введите возраст:"
  age = gets.to_i

  age < 18? puts("Привет, " + name + " " + surname + ". Тебе меньше 18 лет, но никогда не рано") : puts("Привет, " + name + surname + ". Самое время")
end

greeting