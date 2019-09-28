def multiply(num1, num2)
  num1 * num2
end

def square(num, power)
  multiply(num, num)
end

def exponent(num, power)
  result = 1
  power.times do
    result = multiply(result, num)
  end
  result
end