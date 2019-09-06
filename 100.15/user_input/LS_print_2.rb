
number_of_lines = nil
answer = nil

loop do 
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3, or Q to quit:'
    answer = gets.chomp.downcase
    break if answer == 'q'
    number_of_lines = answer.to_i
    break if number_of_lines >= 3
    puts ">> That's not enough lines."
  end

  break if answer == 'q'
    
  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end

end

