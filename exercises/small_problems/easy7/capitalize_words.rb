# START
# INPUT a string
# SPLIT the string by spaces
# CAPITALIZE word[0]
# REJOIN the string 
# RETURN a NEW string with every 1st char of each word capitalized 
#   NOT the first letter, only the first char
# END

def word_cap(str)
  arr = str.downcase.split
  arr.map! do |word|
    word_arr = word.split('')
    word_arr[0].upcase!
    word_arr.join('')
  end

  arr.join(" ")
end

def word_cap2(str)
  str.split.map(&:capitalize).join(" ")
end

CONVERSION_HASH = { 
  "a" => "A", "b" => "B", "c" => "C", "d" => "D", "e" => "E",
  "f" => "F", "g" => "G", "h" => "H", "i" => "I", "j" => "J",
  "k" => "K", "l" => "L", "m" => "M", "n" => "N", "o" => "O",
  "p" => "P", "q" => "Q", "r" => "R", "s" => "S", "t" => "T",
  "u" => "U", "v" => "V", "w" => "W", "x" => "X", "y" => "Y",
  "z" => "Z"
}

def word_cap3(str)
  arr = str.split
  arr.map! do |word|
    new_word = ''
    word.each_char do |char|
      if CONVERSION_HASH.values.include?(char)
        new_word << CONVERSION_HASH.key(char)
      else
        new_word << char
      end
    end

    if CONVERSION_HASH.keys.include?(new_word[0])
      new_word.gsub!(new_word[0], CONVERSION_HASH[new_word[0]])
    end

    new_word
  end

  arr.join(" ")
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts word_cap2('four score and seven') == 'Four Score And Seven'
puts word_cap2('the javaScript language') == 'The Javascript Language'
puts word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

puts word_cap3('four score and seven') == 'Four Score And Seven'
puts word_cap3('the javaScript language') == 'The Javascript Language'
puts word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'



