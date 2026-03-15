def createPokemon()
  puts "Введи имя покемона: "
  name = gets.chomp
  puts "Введи цвет покемона: "
  color = gets.chomp
  pokemon = {name: name, color: color}
  return pokemon
end

puts "Сколько покемонов?"
numPokemons = gets.to_i
pokemons = []

numPokemons.times do
  pokemons.push(createPokemon)
end

puts pokemons


