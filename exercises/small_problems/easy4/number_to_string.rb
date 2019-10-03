NUMBERS = {
  0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"
}

def separating_digits(int)
  int_array = []
  until int < 1
    digit = int % 10
    int_array << digit
    int /= 10
  end

  int_array
end

def integer_to_string(int)
  if int == 0
    return "0"
  else
    int_array = separating_digits(int)
  end

  int_array.map! { |value| value = NUMBERS[value]}.join.reverse
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'
