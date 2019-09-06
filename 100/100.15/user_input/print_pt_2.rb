# def something
#   puts "Do you want me to print something? (y/n)"
#   answer = gets.chomp.downcase

#   if answer == 'y'
#     puts "something"
#   elsif answer != 'n'
#     puts "Invalid response. Please enter y or n."
#     something
#   end

# end

# something


choice = nil

loop do 
  puts "Do you want me to print something?"
  choice = gets.chomp.downcase
  break if %w(y n)include?(choice)
  puts "Invalid response. Please enter y or n."
end

puts 'something' if choice == 'y'