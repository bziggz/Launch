def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then "Subtracting"
  when '3' then "Multiplying"
  when '4' then "Dividing"
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Enter a valid name, dammit!")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("That's not a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("That's not a valid number.")
    end
  end

  operator_prompt = <<-MSG
  What operation should I perform?
      1) add
      2) subtract
      3) multiply
      4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}.")

  prompt("Want to try that again? (press Y if you do)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Go Bucks!")
