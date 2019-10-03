def s_to_i(arr)
  arr.map do |char|
    case char
    when "0" then 0
    when "1" then 1
    when "2" then 2
    when "3" then 3
    when "4" then 4
    when "5" then 5
    when "6" then 6
    when "7" then 7
    when "8" then 8
    when "9" then 9
    end
  end
end

def factorizer(arr)
  factored_array = []

  arr.each_with_index do |int, index|
    factored_array << int * 10 ** index
  end

  factored_array
end

def string_to_integer(string)
  string_array = string.split("")

  int_array = s_to_i(string_array).reverse

  factored_array = factorizer(int_array)  

  factored_array.reduce(:+)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

#______________________________________________

# Get the last digit of the hex number, call this digit the currentDigit.  
# Make a variable, let's call it power.  Set the value to 0.
# Multiply the current digit with (16^power), store the result.
# Increment power by 1.
# Set the the currentDigit to the previous digit of the hex number.
# Repeat from step 3 until all digits have been multiplied.
# Sum the result of step 3 to get the answer number.

DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, 
  "6" => 6, "7" => 7, "8" => 8, "9" => 9, "A" => 10, "B" => 11, 
  "C" => 12, "D" => 13, "E" => 14, "F" => 15 
  }

def hexadecimal_to_integer(string)
  hex_string = string.upcase.split("").reverse

  hex_string.map! { |char| char = DIGITS[char] }

  total = 0

  hex_string.each_with_index do |value, index|
    total += value * 16 ** index
  end

  total
end

p hexadecimal_to_integer('4D9f') == 19871








