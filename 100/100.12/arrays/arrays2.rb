arr = ["b", "a"]
arr = arr.product(Array(1..3))
#puts arr.first.delete(arr.first.last)
#puts "\n"
#puts arr

# 1 returns 1, and mutates array

arr2 = ["b", "a"]
arr2 = arr2.product([Array(1..3)])
puts arr2.first.delete(arr2.first.last)
puts "\n"
puts arr2

# 2 returns [1, 2, 3]
