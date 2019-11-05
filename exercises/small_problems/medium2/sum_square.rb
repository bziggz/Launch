# SOURCE:

# EXTRACT PROBLEM

# INPUT
#   a number

# EXAMPLE
#   sum_square_difference(3) == 22
#      # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
#   sum_square_difference(10) == 2640
#   sum_square_difference(1) == 0
#   sum_square_difference(100) == 25164150

# OUTPUT
#   a number: (1..n).sum ** 2 - ((1 ** 2)..(n ** 2)).sum

# EXPERIMENT / EDGE
#   none, assume int is positive

# ALGO
#   GIVEN a number
#   CREATE an array 1..number
#   CALCULATE sum_square = array.sum ** 2
#   TRANSFORM array 
#     each num = num ** 2
#   CALCULATE squares_sum = array.sum

#   sum_square - squares_sum


def sum_square_difference(num)
  (1..num).sum ** 2 - (1..num).map { |i| i ** 2}.sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150