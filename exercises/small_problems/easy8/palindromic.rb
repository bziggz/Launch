# START
# GIVEN a string 
# RETURN an array of every palidromic substring in the string
# END
def substrings_at_start(str)
  return_arr = []
  1.upto(str.size) do |count|
    return_arr << str[0, count]
  end

  return_arr
end

def substrings(str)
  return_arr = []
  (0...str.size).each do |index|
    substr = str[index..-1]
    return_arr.concat(substrings_at_start(substr))
  end

  return_arr
end

def palindromes(str, ignore = "yes")
  return_arr = substrings(str)

  return_arr.select! do |substr|
    if ignore == 'yes'
      ignore_substr = substr.downcase.delete("^a-z0-9")
      ignore_substr.size > 1 && ignore_substr == ignore_substr.reverse
    else
      substr.size > 1 && substr == substr.reverse
    end
  end

  return_arr
end


p palindromes('abcd') == []
puts "\n"
p palindromes('madam') == ['madam', 'ada']
puts "\n"
p palindromes('hello-madam-did-madam-goodbye', "no") == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts "\n"
p palindromes('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
 ]