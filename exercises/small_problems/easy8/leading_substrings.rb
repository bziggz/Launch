# START 
# INPUT a string 
# RETURN an array of strings
#   - ordered shortest to longest
#   - first string is string[0]
#   - every subsequent string is one char longer
# END

def substrings_at_start(str)
  return_array = []
  1.upto(str.size) do |count|
    return_array << str[0, count]
  end

  return_array
end


p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']