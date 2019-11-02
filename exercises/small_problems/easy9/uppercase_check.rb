# GIVEN string
# RETURN boolean
#   T - all alpha characters are uppercase
#   else F

def  uppercase?(str)
  str.upcase == str
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true