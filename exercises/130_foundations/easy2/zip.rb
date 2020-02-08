def zip(arr1, arr2)
  output = []
  arr1.each_with_index do |el, idx|
    output << [el, arr2[idx]]
  end
  output
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]