loop do 
  puts "What does 2 + 2 equal?"
  answer = gets.chomp.to_i
  until answer == 4
    puts "Wrong answer. Try Again!"
    answer = gets.chomp.to_i
  end
  puts "That's correct!"
  break
end
