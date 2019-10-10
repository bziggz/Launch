# START
# GIVEN two non-empty arrays of equal length
# COMBINE into one NEW array, with elements alternating, but same order 
#   respective to originals
# RETURN new array
# END

def interleave(arr1, arr2)
  new_arr = []
  until arr1.empty? && arr2.empty?
    new_arr << arr1.shift
    new_arr << arr2.shift
  end
  new_arr
end

def further_interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

a = [1, 2, 3]
b = ['a', 'b', 'c']

puts a.object_id
puts b.object_id

p further_interleave(a, b).object_id #== [1, 'a', 2, 'b', 3, 'c']