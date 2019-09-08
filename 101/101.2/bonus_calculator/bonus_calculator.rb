require "yaml"
MESSAGES = YAML.load_file("calculator_config.yml")

def prompt(message)
  puts "=> #{message}"
end

def message(key, language)
  if language == '1'
    MESSAGES["english"][key]
  elsif language == '2'
    MESSAGES["spanish"][key]
  else
    MESSAGES["french"][key]
  end
end

def valid_number?(num)
  num =~ /^\d*\.?\d*$/ || num =~ /^\d+$/
end

def operation_to_message(operator, language)
  message = case operator
            when '1' then message("adding", language)
            when '2' then message("subtracting", language)
            when '3' then message("multiplying", language)
            when '4' then message("dividing", language)
            end

  message
end

prompt(MESSAGES["welcome"])

language = '1'
loop do
  prompt(MESSAGES["language_select"])
  language = gets.chomp

  if %w(1 2 3).include?(language)
    break
  else
    prompt(MESSAGES["invalid_language"])
  end
end

name = ''
loop do
  prompt(message("ask_name", language))
  name = gets.chomp

  if name.empty?
    prompt(message("invalid_name", language))
  else
    break
  end
end

prompt(message("hello", language) + name + "!")

loop do # main loop
  number1 = ''
  loop do
    prompt(message("first_number", language))
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(message("invalid_number", language))
    end
  end

  number2 = ''
  loop do
    prompt(message("second_number", language))
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(message("invalid_number", language))
    end
  end

  prompt(message("operator_prompt", language))

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(message("invalid_operator", language))
    end
  end

  prompt(operation_to_message(operator, language))

  result =  case operator
            when '1'
              if number1 =~ /\./
                number1.to_f + number2.to_f
              else
                number1.to_i + number2.to_i
              end
            when '2'
              if number1 =~ /\./
                number1.to_f - number2.to_f
              else
                number1.to_i - number2.to_i
              end
            when '3'
              if number1 =~ /\./
                number1.to_f * number2.to_f
              else
                number1.to_i * number2.to_i
              end
            when '4'
              number1.to_f / number2.to_f
            end

  prompt(message("result", language) + result.to_s + ".")

  prompt(message("again", language))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(message("goodbye", language))

