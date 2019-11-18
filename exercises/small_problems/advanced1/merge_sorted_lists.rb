# def merge(arr1, arr2)
#   result = []

#   merged_arr = arr1 + arr2

#   until merged_arr.empty?
#     result << merged_arr.slice!(merged_arr.index(merged_arr.min))
#   end

#   result
# end

# SOURCE:

# EXTRACT PROBLEM

# INPUT
#   - two sorted arrays

# EXAMPLE

# OUTPUT
#   - one array, ccombinind both lists, in sorted order

# EXPERIMENT / EDGE
#   - no mutation, must pull correct element to result array

# ALGO
#   GIVEN two arrays
#   IF arr1[0] < arr2[0]
#     result << arr1[0]
#     If arr1[1] < arr2[0]
#   ELSIF arr1[0] >= arr2[0]
#     result << arr2[0]
#     IF arr1[0] < arr2[1]

def merge(arr1, arr2)
  result = []
  a1_count = 0
  a2_count = 0

  loop do
    break if arr1[a1_count].nil? || arr2[a2_count].nil?

    loop do
      break if arr1[a1_count] >= arr2[a2_count]
      result << arr1[a1_count]
      a1_count += 1
    end

    loop do
      result << arr2[a2_count]
      a2_count += 1
      break if a2_count == arr2.size || arr2[a2_count] > arr1[a1_count]
    end
  end

  arr1[a1_count..-1].each { |el| result << el } if arr2[a2_count].nil?
  arr2[a2_count..-1].each { |el| result << el } if arr1[a1_count].nil?

  result
end

p merge([1, 2], [3])
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
