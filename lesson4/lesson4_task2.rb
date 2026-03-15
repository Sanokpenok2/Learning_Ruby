file = File.read("Names.txt")
File.write("results.txt", " ")
line_count = file.lines.count
added_lines = 0
checked_ages = []

def index(file)
  File.foreach(file) do |line|
    puts line
  end
end

loop do
  puts "Введите возраст для поиска (0 - конец программы):"
  age = gets.to_i
  if age == -1
    index("results.txt")
    break
  end

  next if checked_ages.include?(age)

  checked_ages << age
  lines = file.split("\n")
  results = []
  lines.each do |line|
    line.split(" ")[2].to_i == age ? results << line + "\n" : next
  end

  added_lines += results.length
  result_file = File.open("results.txt", mode = "a")
  results.each do |element|
    result_file.write(element)
  end
  result_file.close

  if added_lines == line_count
    index("results.txt")
    break
  end
end


