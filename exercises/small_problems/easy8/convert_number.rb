# START
# INPUT a positive integer
# RETURN an integer
#   - digits reversed
#   - leading and trailing zeros are ignored 
# END

def reversed_number(int)
  int.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1