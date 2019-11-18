# SOURCE:

# EXTRACT PROBLEM
#   fibonacci sequence un to nth times

# INPUT
#   number of times to run fs
# EXAMPLE
#   fibonacci(1) == 1
#   fibonacci(2) == 1
#   fibonacci(3) == 2
#   fibonacci(4) == 3
#   fibonacci(5) == 5
#   fibonacci(12) == 144
#   fibonacci(20) == 6765

# OUTPUT
#   the nth number in the fs

# EXPERIMENT / EDGE
#   none, all positive ints as INPUT

# ALGO
#   GIVEN an integer
#   CREATE an array [0]
#   N times we'll << arr[-2] + arr[-1]
#   output the result

def fibonacci(num)
  return 1 if num == 1
  sequence = [0, 1]

  (num - 1).times do 
    sequence << sequence[-2] + sequence[-1]
  end

  sequence[-1]
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(100_001)