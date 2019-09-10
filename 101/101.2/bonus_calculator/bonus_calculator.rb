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

def get_language_choice
  loop do
    prompt(MESSAGES["language_select"])
    language = gets.chomp

    if %w(1 2 3).include?(language)
      break
    else
      prompt(MESSAGES["invalid_language"])
    end
  end
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

def greet(language)
  name = ""
  loop do
    prompt(message("ask_name", language))
    name = gets.chomp

    if name =~ (/^\S.*\S$/)
      prompt(message("hello", language) + name + "!")
      break
    else
      prompt(message("invalid_name", language))
    end
  end
end

def valid_number?(num)
  num =~ /^\-?\d*\.?\d*$/ || num =~ /^\-?\d+$/
end

def valid_answer?(ans)
  ["y", "yes", "yeah", "sure", "n", "no", "nope", "nah"].include?(ans)
end

def get_number(msg, language)
  loop do
    prompt(message(msg, language))
    number = gets.chomp

    if valid_number?(number)
      return number
    else
      prompt(message("invalid_number", language))
    end
  end
end

def get_operator(language)
  loop do
    prompt(message("operator_prompt", language))
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      return operator
    else
      prompt(message("invalid_operator", language))
    end
  end
end

def number_convert(num)
  num =~ /\./ ? num.to_f : num.to_i
end

def do_the_math(num1, num2, operator)
  num1 = number_convert(num1)
  num2 = number_convert(num2)

  result =  case operator
            when '1' then num1 + num2
            when '2' then num1 - num2
            when '3' then num1 * num2
            when '4' then num1.to_f / num2.to_f
            end

  result
end

def continue?(msg, language)
  loop do
    prompt(message(msg, language))
    answer = gets.chomp.downcase

    if valid_answer?(answer)
      return answer
    else
      prompt(message("invalid_answer", language))
    end
  end
end

prompt(MESSAGES["welcome"])

language = '1'
get_language_choice()

greet(language)

loop do # main loop
  number1 = ""
  number2 = ""
  operator = ""

  loop do
    number1 = get_number("first_number", language)

    number2 = get_number("second_number", language)

    operator = get_operator(language)

    break unless number2.to_i == 0 && operator == "4"
    prompt(message("zero_divide", language))
  end

  prompt(operation_to_message(operator, language))

  result = do_the_math(number1, number2, operator)

  prompt(message("result", language) + result.to_s + ".")

  answer = continue?("again", language)
  break unless ["y", "yes", "yeah", "sure"].include?(answer)
end

prompt(message("goodbye", language))

