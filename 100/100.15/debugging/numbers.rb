# #map iterates over every element, while #select only
# iterates over the elements that meet a condition.


numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n if n.even?
end

p even_numbers