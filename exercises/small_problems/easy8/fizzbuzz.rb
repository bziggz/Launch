# START
# INPUT two integers: first is the start point, second is the end point
# OUTPUT PRINT all numbers between the two numbers
#   IF number is divisible by 3, PRINT "Fizz" instead
#   IF number is divisible by 5, print "Buzz" instead
#   IF number is divisible by 3 && 5, print "FizzBuzz"
# END

def comma_nator(num, num2)
  puts num != num2 ? ", " : ""
end

def fizzbuzz(num1, num2)
  num1.upto(num2) do |num|
    if num % 3 == 0 && num % 5 == 0
      print "FizzBuzz"
      comma_nator(num, num2)
    elsif num % 3 == 0
      print "Fizz"
      comma_nator(num, num2)
    elsif num % 5 == 0
      print "Buzz"
      comma_nator(num, num2)
    else
      print "#{num}"
      comma_nator(num, num2)
    end
  end
end


fizzbuzz(1, 15)