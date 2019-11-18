# Because there was a missing conidtional on the elsif branch, 
#   that branch evaluates the first line of that same branch as its 
#   conditional and if true, executes any following lines in that branch.

# In this case, the empty elsif causes the array.map block to be evaluated.
#   Being truthy, it evaluates as true, so the statement continues down that branch,
#   finding nothing, so returning nil 

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])


# Expected Output

# []
# [21]
# [9, 16]
# [25, 36, 49]