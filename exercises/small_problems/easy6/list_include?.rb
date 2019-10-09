# START
# GIVEN an array and a search value
# LOOKS for search value in array
# RETURN true if search value is in array, false if not
# END

# --CANNOT use include?

def include?(arr, val)
  arr.any? { |el| el == val }
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false