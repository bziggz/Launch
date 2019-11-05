=begin 
SOURCE:

EXTRACT PROBLEM 

INPUT
  a non-empty string

EXAMPLE
  letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
  letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
  letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

OUTPUT 
  a hash of percentages of characters { lower => , upper =>,  non => }

EXPERIMENT / EDGE
  none

ALGO 
  GIVEN a string
  CREATE result hash
  CREATE three counts
  GET string length
  COUNT chars A-Z, chars a-z, non-alpha chars
  FOR EACH count
    result[type] = count / string length
  RETURN hash

=end

def letter_percentages(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  total_chars = string.length.to_f

  result[:lowercase] = string.count("a-z")
  result[:uppercase] = string.count("A-Z")
  result[:neither] = string.count("^a-z", "^A-Z")

  result.each_pair { |type, num| result[type] = (num / total_chars * 100)round(2) }

  result
end



p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }