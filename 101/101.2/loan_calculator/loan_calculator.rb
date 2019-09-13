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

def retrieve_user_name(language)
  loop do
    prompt("name", language)
    name = gets.chomp

    name.strip!

    unless name.empty?
      return name
    end

    prompt("invalid", language)
  end
end

def display_greeting(name, language)
  puts messages("hello", language) + name + "!"
end

def valid_loan_amount?(loan_amount)
  loan_amount.delete(",$").to_f > 0 &&
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

    prompt("invalid_dollar", language)
  end
end

def valid_apr?(apr)
  apr =~ /^\d*\.?\d*$/ && apr.delete(",").to_f >= 0
end

def retrieve_apr(language)
  loop do
    prompt("apr", language)
    apr = gets.chomp.strip

    if valid_apr?(apr)
      return apr
    end

    prompt("invalid", language)
  end
end

def valid_duration?(duration)
  duration =~ /^\d*\.?\d*$/ && duration.delete(",").to_f > 0
end

def retrieve_loan_duration(language)
  loop do
    prompt("loan_duration", language)
    duration = gets.chomp.strip

    if valid_duration?(duration)
      return duration
    end

    prompt("invalid_number", language)
  end
end

def zero?(num_string)
  num_string.to_f == 0
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
  if zero?(num_string)
    num_string = "0.0"
  end

  num_string = num_string.to_s
  num_string = pre_zero_enator(num_string)
  num_string = zero_cents_enator(num_string)
  comma_nator(num_string)
end

def number_formatter(num_string)
  if zero?(num_string)
    num_string = "0.0"
  end

  num_string = num_string.to_s
  num_string = pre_zero_enator(num_string)
  comma_nator(num_string)
end

def display_confirmation(loan_amount, apr, duration, language)
  prompt("confirmation", language)

  puts "#{messages('confirm_amount', language)} "\
        "#{currency_formatter(loan_amount)}"

  puts "#{messages('confirm_apr', language)} "\
        "#{number_formatter(apr)}%"

  puts "#{messages('confirm_duration', language)} "\
        "#{number_formatter(duration)} "\
        "#{messages('months', language)}"

  prompt("correct", language)
end

def retrieve_confirmation(loan_amount, apr, duration, language)
  loop do
    display_confirmation(loan_amount, apr, duration, language)
    answer = gets.chomp.downcase

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
  if mpr == 0
    loan_amount.to_f / duration.to_f
  else
    loan_amount.to_f * (mpr / (1 - (1 + mpr)**(-duration.to_f)))
  end
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
    answer = gets.chomp.downcase

    if valid_answer?(answer)
      return answer
    end

    prompt("invalid", language)
  end
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

puts MESSAGES["welcome"]

language = "1"
language = retrieve_language_selection

name = retrieve_user_name(language)
display_greeting(name, language)

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
    clear_screen()
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
  clear_screen()
end

prompt("goodbye", language)
