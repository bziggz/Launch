NUMBERS = {
  0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"
}

def separating_digits(int)
  int_array = []
  int = int.abs
  until int < 1
    digit = int % 10
    int_array << digit
    int /= 10
  end

  int_array
end

def signenator(int, string)  
  int < 0 ? string.prepend("-") : string.prepend("+")
end

def signed_integer_to_string(int)
  if int == 0
    return "0"
  else
    int_array = separating_digits(int)
  end

  string = int_array.map! { |value| value = NUMBERS[value] }.join.reverse
  signenator(int, string)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'