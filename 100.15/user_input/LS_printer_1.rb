answer = nil

loop do 
  puts "How many times should I print it? Enter a number >= 3:"
  answer = gets.chomp.to_i
  if answer >= 3 
    answer.times {puts "Launch School is the best!" } 
  else
     puts "Not enough lines."
     next
  end
  break
end
