def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 = nil
num2 = nil
loop do 

  loop do 
    puts "Enter a positive or negative integer:"
    num1 = gets.chomp
    if valid_number?(num1) == false
      puts "Number cannot be zero. Try again."
      next
    end
    break
  end

  loop do 
    puts "Enter a positive or negative integer:"
    num2 = gets.chomp
    if valid_number?(num2) == false
      puts "Number cannot be zero. Try again."
      next
    end
    break
  end

  break unless (num1.to_i < 0 && num2.to_i < 0) || (num1.to_i > 0 && num2.to_i > 0)
  puts "One number must be positive and one number must be negative. Try again."
end

result = num1.to_i + num2.to_i
puts "#{num1.to_s} + #{num2.to_s} = #{result.to_s}" 
