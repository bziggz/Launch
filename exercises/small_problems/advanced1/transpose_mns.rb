def transpose(outer_arr)
  result_arr = []
  outer_arr[0].size.times { result_arr << [] }

  outer_arr.each do |arr|
    0.upto(arr.size - 1) do |count|
      result_arr[count] << arr[count]
    end
  end

  result_arr
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]