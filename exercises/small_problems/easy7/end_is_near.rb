# START
# GIVEN a string at least two words long
# RETURN the second to last word
# END

# START
# GIVEN a string of any number of words
# RETURN the middle word
# END

# ---EDGE CASES
#   even number of words : return the middle two words
#   empty string: return empty string
#   one word string: return that word


def penultimate(str)
  str.split[-2]
end

def middle_word(str)
  return str unless str.split.size >= 2

  new_str = ""
  arr = str.split
  middle = arr.size / 2
  if arr.size.even?
    new_str << arr[middle - 1] + " " + arr[middle]
  else
    new_str = arr[middle]
  end

  new_str
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle_word('what is the last word, yo?') == 'the last'
p middle_word('Launch School is really great!') == 'is'
p middle_word('The Dude Abides') == 'Dude'
p middle_word('Launch') == 'Launch'
p middle_word('') == ''