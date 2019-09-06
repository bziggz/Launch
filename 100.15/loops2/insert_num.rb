numbers = []

loop do 
  puts 'Enter any number:'
  numbers.push(gets.chomp.to_i)
  break if numbers.size == 5
end
puts numbers.to_s