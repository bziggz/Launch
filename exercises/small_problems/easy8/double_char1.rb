# START 
# INPUT a string
# RETURN a new string
#   - each char doubled
# END

def repeater(str)
  new_str = ""
  str.each_char { |char| new_str << char * 2 }
  new_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''