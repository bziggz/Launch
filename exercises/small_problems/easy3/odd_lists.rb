def oddities(arr)
  output = []
  arr.each_with_index do |value, index|
    if index % 2 == 0 
      output << value
    else
      next
    end
  end

  output
end

def evensies(arr)
  output = []
  count = 0
  until count == arr.size
    if count % 2 != 0 
      output << arr[count]
    end
    count += 1
  end

  output
end

def third_way_odd(arr)
  count = 0
  arr.each_with_object([]) do |value, array|
    array << value if count % 2 == 0
    count += 1
  end
end


p oddities([2, 3, 4, 5, 6])  == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6])  == [1, 3, 5]
p oddities(['abc', 'def'])  == ['abc']
p oddities([123])   == [123]
p oddities([])   == []

p evensies([2, 3, 4, 5, 6])  
p evensies([1, 2, 3, 4, 5, 6])  
p evensies(['abc', 'def'])  
p evensies([123])  
p evensies([])  

p third_way_odd([2, 3, 4, 5, 6])  
p third_way_odd([1, 2, 3, 4, 5, 6])  
p third_way_odd(['abc', 'def'])  
p third_way_odd([123])  
p third_way_odd([])  