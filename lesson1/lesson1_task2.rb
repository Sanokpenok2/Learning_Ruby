def foobar(a, b)
  return ((a == 20 || b == 20) ? b : a + b)
end

puts "Введите a:"
a = gets.to_i
puts "Введите b:"
b = gets.to_i

result = foobar(a, b)

puts "Ответ #{result}"
