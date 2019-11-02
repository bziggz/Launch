# GIVEN an integer
# IF integer is a double number
#   RETURN integer
# ELSE
#   RETURN integer * 2
# END

# DOUBLE NUMBER = integer with even number of digits where digits on left are
#                 the same as digits on the right

def twice(int)
  string_int = int.to_s
  divider = string_int.size / 2

  string_int[0...divider] == string_int[divider..-1] ? int : int * 2
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10