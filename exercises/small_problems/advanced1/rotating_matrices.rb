def rotate90(outer_arr)
  result_arr = []
  outer_arr[0].size.times { result_arr << [] }

  outer_arr.reverse.each do |arr|
    0.upto(arr.size - 1) do |count|
      result_arr[count] << arr[count]
    end
  end

  result_arr
end

def further_rotation(arr, degrees = 90)
  (degrees / 90).times { arr = rotate90(arr) }
  arr
end




matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = further_rotation(matrix1, 90)
new_matrix2 = further_rotation(matrix2, 90)
new_matrix3 = further_rotation(matrix2, 360)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
puts "\n"
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
puts "\n"
p new_matrix3 == matrix2