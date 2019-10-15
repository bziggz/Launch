# START
# INPUT an array of numbers
# CALULATE sum of the sums of each leading subsequence (a) + (a + b) + (a + b + c)
# RETURN total sum
# END
# --assume array has at least one element

def sum_of_sums(arr)
  total = 0
  arr.size.times do 
    total += arr.sum
    arr.pop
  end

  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35