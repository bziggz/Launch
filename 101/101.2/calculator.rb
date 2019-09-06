# ask the user for two numbers
# ask the user for an operator
# perform the operation on the  two numbers
# Output the result

puts "Welcome to Calculator!"
puts "What is the first number?"
number1 = gets.chomp

puts "What is the second number?"
number2 = gets.chomp

puts "What operation should I perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
else
  result = number1.to_f / number2.to_f
end

puts "The result is #{result}."