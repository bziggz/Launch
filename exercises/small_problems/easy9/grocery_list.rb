# GIVEN a nested array
# RETURN a flat array with each subarray[0] listed subarray[1] times

def buy_fruit(arr)
  result = []

  arr.each do |item|
    item[1].times { result << item[0] }
  end

  result
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]