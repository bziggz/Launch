count = 1

loop do
  if count % 2 == 0
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  count += 1
  break if count > 5 
end