password = "New England Clam Chowder"

loop do 
  puts "What's the password?"
  answer = gets.chomp
  break puts "Is that the red or the white?" if answer == password
  puts "Nope!"
end



