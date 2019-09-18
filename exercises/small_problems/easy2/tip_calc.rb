puts "How much is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip = gets.chomp.to_f

tip = tip / 100 * bill

puts "The tip is $#{format("%.02f", tip)}"
puts "The total is $#{format("%.02f", (bill + tip))}"

