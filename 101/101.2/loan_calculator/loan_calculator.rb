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

def retrieve_language_selection
  loop do
    puts MESSAGES["select_language"]
    language = gets.chomp

    if %w(1 2 3).include?(language)
      return language
    end

    puts MESSAGES["invalid_language"]
  end
end

def greet(language)
  name = ""
  loop do
    prompt("name", language)
    name = gets.chomp

    name.strip!

    unless name.empty?
      puts messages("hello", language) + name + "!"
      break
    end

    prompt("invalid", language)
  end
end

def valid_loan_amount?(loan_amount)
  !(loan_amount =~ /\-/) &&
    (loan_amount =~ /^\$?\d{1,3}(\,\d{3})*(\.\d{,2})?$/ ||
    loan_amount =~ /^\$?\d*(\.?\d{,2})?$/)
end

def retrieve_loan_amount(language)
  loop do
    prompt("loan_amount", language)
    loan_amount = gets.chomp.strip

    if valid_loan_amount?(loan_amount)
      return loan_amount.delete(",$")
    end

    prompt("invalid", language)
  end
end

def retrieve_apr(language)
  loop do
    prompt("apr", language)
    apr = gets.chomp.strip

    if apr =~ /^\d*\.?\d*$/ && !(apr =~ /\-/)
      return apr
    end

    prompt("invalid", language)
  end
end

def retrieve_loan_duration(language)
  loop do
    prompt("loan_duration", language)
    duration = gets.chomp.strip

    if duration =~ /^\d*\.?\d*$/ && !(duration =~ /\-/)
      return duration
    end

    prompt("invalid", language)
  end
end

def zero_cents_enator(num_string)
  if num_string =~ /\./
    until num_string[-3] == "\."
      num_string << "0"
    end
  end

  num_string
end

def pre_zero_enator(num_string)
  if num_string[0] == "."
    num_string = "0" + num_string
  end

  until num_string[0] =~ /[1-9]/ || num_string[1] == "."
    num_string.slice!(0)
  end

  num_string
end

def comma_nator(num)
  commas = ""
  counter = 0
  num_string = num.to_s.reverse

  decimal_idx = num_string =~ /\./ ? num_string.index(".") + 1 : 0

  while counter < num_string.length
    commas << if counter > decimal_idx && (counter - decimal_idx) % 3 == 0
                "," + num_string[counter]
              else
                num_string[counter]
              end

    counter += 1
  end

  commas.reverse
end

def currency_formatter(num_string)
  num_string = num_string.to_s
  num_string = pre_zero_enator(num_string)
  num_string = zero_cents_enator(num_string)
  comma_nator(num_string)
end

def number_formatter(num_string)
  num_string = num_string.to_s
  num_string = pre_zero_enator(num_string)
  comma_nator(num_string)
end

def retrieve_confirmation(loan_amount, apr, duration, language)
  loop do
    prompt("confirmation", language)
    puts "#{messages('confirm_amount', language)} "\
          "#{currency_formatter(loan_amount)}"
    puts "#{messages('confirm_apr', language)} #{number_formatter(apr)}%"
    puts "#{messages('confirm_duration', language)} "\
          "#{number_formatter(duration)} "\
          "#{messages('months', language)}"

    prompt("correct", language)
    answer = gets.chomp

    if valid_answer?(answer)
      return answer
    end

    prompt("invalid", language)
  end
end

def valid_answer?(ans)
  ["y", "yes", "yeah", "sure", "n", "no", "nope", "nah"].include?(ans)
end

def continue?(ans)
  ["y", "yes", "yeah", "sure"].include?(ans)
end

def calculate_mpr(apr)
  apr.to_f / 100 / 12
end

def calculate_monthly_payment(loan_amount, mpr, duration)
  loan_amount.to_f * (mpr / (1 - (1 + mpr)**(-duration.to_f)))
end

def calculate_total(duration, monthly_payment)
  duration.to_f * monthly_payment
end

def calculate_interest(total, loan_amount)
  total - loan_amount.to_f
end

def give_results(monthly_payment, principal, interest, total, language)
  monthly_payment = currency_formatter(monthly_payment.round(2))
  interest = currency_formatter(interest.round(2))
  total = currency_formatter(total.round(2))

  puts "#{messages('monthly_payment', language)}#{monthly_payment}"
  puts "#{messages('principal', language)}#{principal}"
  puts "#{messages('interest', language)}#{interest}"
  puts "#{messages('total', language)}#{total}"
end

def retrieve_another_calc_choice(language)
  loop do
    prompt("again", language)
    answer = gets.chomp

    if valid_answer?(answer)
      return answer
    end

    prompt("invalid", language)
  end
end

puts MESSAGES["welcome"]

language = "1"
language = retrieve_language_selection

greet(language)

loop do # MAIN LOOP
  loan_amount = ""
  apr = ""
  duration = ""

  loop do
    loan_amount = retrieve_loan_amount(language)
    apr = retrieve_apr(language)
    duration = retrieve_loan_duration(language)

    answer = retrieve_confirmation(loan_amount, apr, duration, language)
    break if continue?(answer)
  end

  mpr = calculate_mpr(apr)

  monthly_payment = calculate_monthly_payment(loan_amount, mpr, duration)

  principal = currency_formatter(loan_amount.to_f.round(2))

  total = calculate_total(duration, monthly_payment)

  interest = calculate_interest(total, loan_amount)

  if monthly_payment > total
    monthly_payment = total
  end

  give_results(monthly_payment, principal, interest, total, language)

  answer = retrieve_another_calc_choice(language)
  break unless continue?(answer)
end

prompt("goodbye", language)
