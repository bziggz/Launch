# SOURCE:

# EXTRACT PROBLEM

# INPUT
#   an array

# EXAMPLE
#   array = [5, 3]
#   bubble_sort!(array)
#   array == [3, 5]

#   array = [6, 2, 7, 1, 4]
#   bubble_sort!(array)
#   array == [1, 2, 4, 6, 7]

#   array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
#   bubble_sort!(array)
#   array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# OUTPUT
#   SAME array sorted < to >

# EXPERIMENT / EDGE
#   none, assume array contains 2+ of all same type

# ALGO
#   GIVEN an array
#   
#   SET count to 0
#   ITERATE though array up to arr.size - 2 
#   SET swap_made to false
#     COMPARE arr[count] with arr[count + 1]
#       IF arr[count] > arr[count + 1]
#         a,b = b, a
#         set swap_made to true
#       ELSE
#         leave as is
#       END
#   AFTER ITERATION 
#     BREAK if swap_made == no

def swap!(arr, count)
  arr[count], arr[count + 1] = arr[count + 1], arr[count]
end

def bubble_sort!(arr)
  comparisons = arr.size - 1

  loop do
    swap_made = false
    count = 0
    
    comparisons.times do
      if arr[count] > arr[count + 1]
        swap!(arr, count)
        swap_made = true
      end

      count += 1
    end

    comparisons -= 1
    break if swap_made == false
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
