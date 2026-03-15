a = gets.chomp
if a[-1].downcase == 's' && a[-2].downcase == 'c'
  puts 2**a.size
else
  puts a.reverse
end
