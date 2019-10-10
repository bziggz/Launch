CONVERSION_HASH = { 
  "a" => "A", "b" => "B", "c" => "C", "d" => "D", "e" => "E",
  "f" => "F", "g" => "G", "h" => "H", "i" => "I", "j" => "J",
  "k" => "K", "l" => "L", "m" => "M", "n" => "N", "o" => "O",
  "p" => "P", "q" => "Q", "r" => "R", "s" => "S", "t" => "T",
  "u" => "U", "v" => "V", "w" => "W", "x" => "X", "y" => "Y",
  "z" => "Z"
}

def swapcase(str)
  new_string = ''
  str.each_char do |char|
    if CONVERSION_HASH.values.include?(char)
      new_string << CONVERSION_HASH.key(char)
    elsif CONVERSION_HASH.keys.include?(char)
      new_string << CONVERSION_HASH[char]
    else
      new_string << char
    end
  end

  new_string
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'