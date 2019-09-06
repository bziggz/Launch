num = 9346

thous = num / 1000

hun = (num % 1000) / 100

tens = ((num % 1000) % 100) / 10

ones = ((num % 1000) % 100) % 10

puts "Thousands: #{thous}"
puts "Hundreds: #{hun}"
puts "Tens: #{tens}"
puts "Ones: #{ones}"