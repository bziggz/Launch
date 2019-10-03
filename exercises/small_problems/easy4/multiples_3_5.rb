def multisum(num)
  arr = []

  (1..num).each do |number|
    if number % 3 == 0 || number % 5 == 0
      arr << number
    end
  end

  arr.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
