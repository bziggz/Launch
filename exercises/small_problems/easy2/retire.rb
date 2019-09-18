puts "How old are you?"
age = gets.chomp.to_i

puts "How old do you want to be when you retire?"
retire_age = gets.chomp.to_i

time_left = retire_age - age

this_year = Time.now.year

puts "It's #{this_year} now. You will retire in #{this_year + time_left}."
puts "You only have #{time_left} years until you retire!"