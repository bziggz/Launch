def select(arr)
  counter  = 0 
  return_arr = []

  while counter < arr.size
    return_arr << arr[counter] if !!yield(arr[counter])
    counter += 1
  end

  return_arr
end

tester = select([1, 2, 3, 4, 5, 6]) { |num| puts num }
p tester