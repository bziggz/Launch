puts "What's your first name?"

first_name = gets.chomp

puts "What's your last name?"

last_name = gets.chomp

puts "What's up, #{first_name}?!"

10.times { puts first_name + " " + last_name }