CHARACTERS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
  }

def totaling_num(arr)
  arr.map! { |char| char = CHARACTERS[char] }

  total = 0

  arr.each_with_index do |value, index|
    total += value * 10 ** index
  end

  total
end

def string_to_signed_integer(string)
  int_string = string.split("").reverse

  if int_string[-1] == "+"
    int_string.pop
    totaling_num(int_string)
  elsif int_string[-1] == "-"
    int_string.pop
    -(totaling_num(int_string))   
  else
    totaling_num(int_string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100