# START
# INPUT a non-empty string
# RETURN the middle char
#   - if str.size.odd? - return one char
#     if str.size.even? return two chars
# END

def center_of(str)
  result = ""
  if str.size.even?
    result << str[str.size / 2 - 1, 2]
  else
    result << str[str.size / 2]
  end

  result
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'