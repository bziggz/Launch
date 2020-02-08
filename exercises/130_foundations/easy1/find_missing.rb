def missing(arr)
  counter = arr[0]
  result = []

  while counter < arr[-1]
    result << counter unless arr.include?(counter)
    counter += 1
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []