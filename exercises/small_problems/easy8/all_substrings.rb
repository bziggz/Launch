# START
# INPUT a string 
# RETURN an array of strings 
#   - every substring ordered first by starting char, then by size
# END

def substrings_at_start(str, start)
  return_array = []
  1.upto(str.size) do |count|
    return_array << str[(start - 1), count]
  end

  return_array
end

def substrings(str)
  final_arr = []
  1.upto(str.size) do |count|
    final_arr << substrings_at_start(str, count)
  end
  final_arr.flatten.uniq
end




p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]