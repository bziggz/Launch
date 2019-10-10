# START
# INPUT an array of integers
# MULTIPLY all integers
# DIVIDE answer by number of integers
# PRINT the result rounded to 3 decimal places
# END

def show_multiplicative_average(arr)
  answer = (arr.inject(:*) / arr.size.to_f)
  p "The result is #{"%.3f" % answer}"
end


show_multiplicative_average([3, 5])
#The result is 7.500

show_multiplicative_average([6])
#The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
#The result is 28361.667
