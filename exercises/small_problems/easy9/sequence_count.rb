# GIVEN two integers, int1 + int2
# int1 is how many numbers to return
# int2 is the starting num and the interval 
# RETURN an array of int1 length
#   if 0, empty array

def sequence(num1, num2)
  result = [num2]

  if num1 == 0
    result = []
  else
    (num1 - 1).times do
      result << result[-1] + num2
    end
  end

  result
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []