=begin
SOURCE:

EXTRACT PROBLEM

INPUT
  a number and a count

EXAMPLE
  rotate_rightmost_digits(735291, 1) == 735291
  rotate_rightmost_digits(735291, 2) == 735219
  rotate_rightmost_digits(735291, 3) == 735912
  rotate_rightmost_digits(735291, 4) == 732915
  rotate_rightmost_digits(735291, 5) == 752913
  rotate_rightmost_digits(735291, 6) == 352917

OUTPUT
  rotated number

EXPERIMENT / EDGE
 none, n is always > 0

ALGO
  CONVERT num to_s.to_a array
  CREATE temp array of count length
  CALL rotate_array on temp_array
  REJOIN array
  CONVERT array to_s.to_i integer
=end


def rotate_rightmost_digits(num, count)
  orig_arr = num.to_s.chars
  temp_arr = orig_arr.slice!(-count..-1)

  (orig_arr << rotate_array(temp_arr)).join.to_i
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917