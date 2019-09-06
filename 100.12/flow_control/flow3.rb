puts "Enter a number between 0 and 100:"
num = gets.chomp.to_i

if num < 0 
    puts "Please enter a positive number. Try again."
  elsif num <= 50
    puts "You selected #{num}, which is between 0 and 50."
  elsif num <= 100
    puts "You selected #{num}, which is between 51 and 100."
  else
    puts "That is not less than 100. Try again."
end

