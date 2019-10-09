# START
# INPUT two arrays
# COMBINE the two arrays into one
# REMOVE any duplicates
# RETURN combined, filtered array
# END

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([1, 3, 5, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]