def reduce(arr, acc = nil)
  if acc.nil?
    counter = 1
    accumulator = arr[0]
  else
    counter = 0
    accumulator = acc
  end

  while counter < arr.size
    accumulator = yield(accumulator, arr[counter])
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? } 

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }  # => [1, 2, 'a', 'b']