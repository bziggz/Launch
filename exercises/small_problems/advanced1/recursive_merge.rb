require "pry"
require "pry-byebug"

def merge(arr1, arr2)
  result = []
  a1_count = 0
  a2_count = 0

  loop do
    break if arr1[a1_count].nil? || arr2[a2_count].nil?

    loop do
      break if arr1[a1_count].nil? || arr2[a2_count].nil? || arr1[a1_count] >= arr2[a2_count] 
      result << arr1[a1_count]
      a1_count += 1
    end

    loop do
      result << arr2[a2_count]
      a2_count += 1
      break if arr1[a1_count].nil? || arr2[a2_count].nil? || arr2[a2_count] > arr1[a1_count]
    end
  end

  arr1[a1_count..-1].each { |el| result << el } if arr2[a2_count].nil?
  arr2[a2_count..-1].each { |el| result << el } if arr1[a1_count].nil?

  result
end

def merge_sort(arr)
  return arr if arr.size == 1
  merge(merge_sort(arr[0...(arr.size / 2)]), merge_sort(arr[(arr.size / 2)..-1]))
end

def non_recursive_merge_sort(arr)
  return arr if arr.size == 1

  temp_arr = [arr[0...(arr.size / 2)], arr[(arr.size / 2)..-1]]

  temp_arr.map do |inner_arr|
    if inner_arr.size > 1
      inner_arr.map do |innerer_arr|
        if innerer_arr.size > 1
          innerer_arr = [innerer_arr[0...(innerer_arr.size / 2)], innerer_arr[(innerer_arr.size / 2)..-1]]
        else
          innerer_arr
        end
      end
    else
      inner_arr
    end
  end

  temp_arr
end

# p merge_sort(["b"])
# p merge_sort(["a", "b", "c"])
# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]


# p non_recursive_merge_sort(["b"])
p non_recursive_merge_sort(["a", "b", "c"])
p non_recursive_merge_sort([9, 5, 7, 1])# == [1, 5, 7, 9]
p non_recursive_merge_sort([5, 3]) #== [3, 5]
p non_recursive_merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
# p non_recursive_merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p non_recursive_merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
