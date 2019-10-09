# START
# INPUT an array
# DIVIDE array into two equal parts
#   IF arr.size.odd?, 1st array gets middle element
# RETURN one array with the two nested in into
# END

def halvsies(arr)
  divider = (arr.size / 2.0).ceil
  arr1 = arr.slice(0, divider)
  arr2 = arr.slice(divider..-1)
  [arr1, arr2]
end


p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]