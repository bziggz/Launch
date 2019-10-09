# START
# GIVEN fibonacci sequence  a + b = c | b + c = d | c + d = e 
# INPUT the number of digits in a number (integer)
# CREATE an array 
# CALCULATE fibonacci sequence until final_num is as long as INPUT
# POPULATE array with sequence nums
# OUTPUT index of final_num + 1
# END

def find_fibonacci_index_by_length(num)
  arr = [1, 1]
  loop do
    arr << arr[-2] + arr[-1]
    break if arr[-1].to_s.size >= num
  end
  arr.size
end



p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847