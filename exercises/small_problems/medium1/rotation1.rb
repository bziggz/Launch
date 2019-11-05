=begin 

SOURCE:

EXTRACT PROBLEM 

INPUT
  given an array

EXAMPLE
  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  rotate_array(['a']) == ['a']

  x = [1, 2, 3, 4]
  rotate_array(x) == [2, 3, 4, 1]   # => true
  x == [1, 2, 3, 4]   

OUTPUT 

EXPERIMENT / EDGE
  NO ROTATE OR ROTATE!

ALGO 
  DON"T MUTATE ORIGINAL
  GIVEN an array
  CREATE new array
    append arr[1..] + arr[0]
  RETURN a new array with arr[0] == arr[-1], all    others in original order
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  str[1..-1] + str[0]
end

def rotate_integer(int)
  (int.to_s[1..-1] + int.to_s[0]).to_i
end

p rotate_integer(2346257)

p rotate_string("hello")

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4] 