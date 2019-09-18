puts "Gimme a name:"
name = gets.chomp.strip
name.empty? ? name = "Teddy" : name

puts "#{name} is #{rand(20..200)} years old!"