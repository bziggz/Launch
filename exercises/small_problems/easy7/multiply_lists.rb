# START
# GIVEN two arrays of same length
# CREATE NEW ARRAY
# MULTIPLY the elements of both arrays at matching index
# POPULATE new array with answer
# RETURN new array
# END

def multiply_list(arr1, arr2)
  new_arr = []
  arr1.each_with_index { |el, i| new_arr << arr1[i] * arr2[i] }
  new_arr
end

def multiply_zip_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*) }
end 

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

p multiply_zip_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]