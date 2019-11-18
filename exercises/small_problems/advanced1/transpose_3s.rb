# SOURCE:

# EXTRACT PROBLEM
  # 1  5  8       1  4  3
  # 4  7  2  =>   5  7  9
  # 3  9  6       8  2  6

  # 1  2  3       1  4  7
  # 4  5  6  =>   2  5  8
  # 7  8  9       3  6  9

  # [[1, 2, 3], [4, 5, 6], [7, 8, 9]] => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]


# INPUT
#   a nested array signifying a 3x3 matrix [line 1, line 2, line 3]

# EXAMPLE
#       matrix = [
#       [1, 5, 8],
#       [4, 7, 2],
#       [3, 9, 6]
#     ]

#     new_matrix = transpose(matrix)

#     p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
#     p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# OUTPUT
#   a NEW nested array wiwth same outer elements as input

# EXPERIMENT / EDGE
#   none
#   CANNOT use #transpose

# ALGO
#   GIVEN a nested array rep a matrix
#   INIT a new, empty but nested array
#   FOR EACH array in outer array
#     INIT counter
#     out[1].each goes into new[0][counter]
#     ...
#     ...
#   RETURN new nested array


def transpose(arr)
  result_arr = []
  arr.size.times { result_arr << [] }

  arr.each do |arr|
    0.upto(arr.size - 1) do |count|
      result_arr[count] << arr[count]
    end
  end

  result_arr
end

def transpose!(arr)
  inner_arr_size = arr[0].size

  0.upto(arr.size - 1) do |outer_count|
    0.upto(inner_arr_size - 1) do |inner_count|
      arr[outer_count][inner_count], arr[inner_count][outer_count] = 
        arr[inner_count][outer_count], arr[outer_count][inner_count]
    end 
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# four_matrix = [
#   [1, 2, 3, 4],
#   [5, 6, 7, 8],
#   [9, 10, 11, 12],
#   [13, 14, 15, 16]
# ]

# new_four_matrix = transpose(four_matrix)

# p four_matrix
# p new_four_matrix

transpose!(matrix)

p matrix 