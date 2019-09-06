user_name = "Cyril Figgus"
password = "GUEST"

loop do 
  puts "Enter your Username:"
  user = gets.chomp

  puts "Enter your Password:"
  word = gets.chomp

  break if user == user_name && word == password
  puts "What whaaat?!"
end

puts "Holy s***, our security is atrocious."