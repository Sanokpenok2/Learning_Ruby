START_BALANCE = 100.0
PATH = "balance.txt"
balance = 0

if File.exist?(PATH)
  balance = File.read(PATH).to_f
else
  File.write(PATH, START_BALANCE)
  balance = START_BALANCE
end

loop do
  puts "Введите действие:\n -> D - положить деньги\n -> W - снять деньги\n -> B - проверить баланс\n -> Q - выйти\n----> "
  action = gets.chomp.upcase
  case action
  when "D"
    puts "Введите количество денег для депозита:"
    deposit = gets.chomp.to_f
    if deposit < 0
      puts "Нельзя сделать отрицательный депозит!"
      next
    end
    if deposit != 0
      balance += deposit
      puts "Успешный депозит!"
      puts "Ваш баланс: #{balance}"
    else puts "Баланс не изменён!"
    end
  when "W"
    puts "Введите количество денег для снятия:"
    get_out_cash = gets.chomp.to_f
    if get_out_cash < 0
      puts "Нельзя снять отрицательное количество денег!"
      next
    end
    if get_out_cash != 0
      if get_out_cash <= balance
        balance -= get_out_cash
        puts "Успешное снятие денег!"
        puts "Ваш баланс: #{balance}"
      else puts "Недостаточно средств!"
      end
    else puts "Баланс не изменён!"
    end
  when "B"
    puts "Ваш баланс: #{balance}"
  when "Q"
    puts "Завершение цикла"
    File.write(PATH, balance)
    break
  else puts "Неизвестная команда"
  end
end
