def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do 
  puts "Please enter the numerator:"
  numer = gets.chomp

  if valid_number?(numer) == false
    puts "Invalid entry. Please enter a whole number."
    next
  end

  loop do 
    puts "Please enter the denominator:"
    denom = gets.chomp

    if valid_number?(denom) == false
      puts "Invalid entry. Please enter a whole number."
      next
    elsif denom == '0'
      puts "Invalid entry. Denominator can not be zero."
      next
    end

    puts "#{numer} / #{denom} is #{numer.to_i / denom.to_i}"
    break
  end
  
  break
end






