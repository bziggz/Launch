# START
# GIVEN two arrays
# CREATE a new arrays
# MULTIPLY every num from arr1 with every num in arr2
# POPULATE new array with answers
# SORT new array
# RETURN new array
# END

def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each do |el1|
    arr2.each do |el2|
      new_arr << el1 * el2
    end
  end

  new_arr.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]