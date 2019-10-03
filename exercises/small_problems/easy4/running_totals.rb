def running_total(arr)
  start = []

  unless arr.empty?
    start << arr.shift
    arr.each { |value| start << start[-1] + value }
  end

  start
end

def running_total_with_object(arr)
  sum = 0
  arr.each_with_object([]) do |value, array|
    array << sum += value
  end
end

def running_total_with_inject(arr)
  total = 0
  arr.inject([]) do |sums, value|
      sums << total += value
  end
end



p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts "\n"

p running_total_with_object([2, 5, 13]) == [2, 7, 20]
p running_total_with_object([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_with_object([3]) == [3]
p running_total_with_object([]) == []

puts "\n"

p running_total_with_inject([2, 5, 13]) == [2, 7, 20]
p running_total_with_inject([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_with_inject([3]) == [3]
p running_total_with_inject([]) == []