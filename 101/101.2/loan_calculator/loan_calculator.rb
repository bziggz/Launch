require "yaml"

MESSAGES = YAML.load_file("loan_calculator_config.yml")

def prompt(message, language)
  puts "=> #{messages(message, language)}"
end

def messages(message, language)
  if language == "1"
    MESSAGES["english"][message]
  elsif language == "2"
    MESSAGES["spanish"][message]
  else
    MESSAGES["japanese"][message]
  end
end

def comma_nator(num)
  commas = ""
  counter = 0
  num_string = num.to_s.reverse

  if num_string =~ /\./
    until num_string[2] == "\."
      num_string = "0" + num_string
    end
  end

  while counter < num_string.length
    if num_string =~ /\./ && [6, 9, 12, 15, 18].include?(counter)
      commas << ",#{num_string[counter]}"
    elsif !(num_string =~ /\./) && [3, 6, 9, 12, 15].include?(counter)       
      commas << ",#{num_string[counter]}"
    else
      commas << num_string[counter]
    end
    counter += 1
  end

  commas.reverse!
end

puts "=> Welcome to the Loan Calculator! -- ¡Bienvenido a la Calculadora de préstamos! -- ローン計算機へようこそ！"

language = "1"
loop do
  puts %(\n=> Please select your language: -- Por favor seleccione su idioma: -- 言語を選択してください：

  1\) English
  2\) Español
  3\) 日本人
  )
  language = gets.chomp

  if %w(1 2 3).include?(language)
    break
  else
    puts "Invalid Selection."
  end
end

name = ""
loop do
  prompt("name", language)
  name = gets.chomp
  unless name.empty?
    puts messages("hello", language) + name + "!"
    break
  end
end

loop do
  loan_amount = ""
  apr = ""
  duration = ""
  loop do
    loop do
      prompt("loan_amount", language)
      loan_amount = gets.chomp

      if loan_amount =~ /^\$?\d{,3}\,?\d{,3}\,?\d{,3}\,?\d{,3}\,?\d{,3}\.?\d{,2}$/
        break
      else
        prompt("invalid", language)
      end
    end

    if loan_amount =~ /\,/ || loan_amount =~ /\$/
      loan_amount = loan_amount.delete("\,\$")
    end

    loop do
      prompt("apr", language)
      apr = gets.chomp

      if apr =~ /^\d*\.?\d*$/
        break
      else
        prompt("invalid", language)
      end
    end

    loop do
      prompt("loan_duration", language)
      duration = gets.chomp

      if duration =~ /^\d*\.?\d*$/
        break
      else
        prompt("invalid", language)
      end
    end

    prompt("confirmation", language)
    puts "#{messages('confirm_amount', language)}#{comma_nator(loan_amount)}"
    puts "#{messages('confirm_apr', language)} #{apr}%"
    puts "#{messages('confirm_duration', language)} #{duration} #{messages('months', language)}"
    prompt("correct", language)
    answer = gets.chomp
    break if answer.downcase.start_with?("y")
  end

  mpr = apr.to_f / 100 / 12
  monthly_payment = loan_amount.to_f * (mpr / (1 - (1 + mpr)**(-duration.to_f)))
  total = duration.to_f * monthly_payment
  interest = total - loan_amount.to_f

  puts "#{messages('monthly_payment', language)}#{comma_nator(monthly_payment.round(2))}"
  puts "#{messages('principal', language)}#{comma_nator(loan_amount.to_f.round(2))}"
  puts "#{messages('interest', language)}#{comma_nator(interest.round(2))}"
  puts "#{messages('total', language)}#{comma_nator(total.round(2))}"

  prompt("again", language)
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("goodbye", language)








