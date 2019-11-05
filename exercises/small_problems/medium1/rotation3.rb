=begin
SOURCE:

EXTRACT PROBLEM

INPUT
  a number

EXAMPLE
  max_rotation(735291) == 321579
  max_rotation(3) == 3
  max_rotation(35) == 53
  max_rotation(105) == 15 # the leading zero gets dropped
  max_rotation(8_703_529_146) == 7_321_609_845
OUTPUT
  rotated number

EXPERIMENT / EDGE
  if there's a leading 0 ever, it get's dropped 
  numbers longer than 6 digits?

ALGO
  GIVEN a number
  rotate_rightmost_digits(num, count = num.length)
  rotate_rightmost_digits(newnum, count -= 1)

=end

def max_rotation(num)
  result = num.to_s
  digits = result.length

  (0...digits - 1).each do |i|
    result = rotate_rightmost_digits(result, digits - i)
  end

  result.to_i
end

def rotate_rightmost_digits(num_string, count)
  orig_arr = num_string.chars
  temp_arr = orig_arr.slice!(-count..-1)

  (orig_arr << rotate_array(temp_arr)).join
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end


p max_rotation(7520093)