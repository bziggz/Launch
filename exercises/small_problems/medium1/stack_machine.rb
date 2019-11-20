# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# SOURCE:

# EXTRACT PROBLEM

# INPUT
#   a string of stack commands

# EXAMPLE

# OUTPUT
#   integers dependant on the stack commands

# EXPERIMENT / EDGE

# ALGO
# GIVEN a string of commands
# INIT an array = str.split
# INIT a value = 0
# ITERATE over array
#   INIT case statement for each possible command


# TEST CASES

#   HAPPY PATHS:

#   EDGE:
#     EMPTY:
#     BOUNDARY:
#     DUPLICATES:
#     CASE:
#     DATA TYPE:

#   FAILURE:
#     EXCEPTION/ERROR:
#     SPECIAL VALUES:

def minilang(str)
  stack = []
  register = 0

  str.split.each_with_index do |command, idx|
    case command
    when "PUSH" then  stack << register
    when "ADD" then   register += stack.pop
    when "SUB" then   register -= stack.pop
    when "MULT" then  register *= stack.pop
    when "DIV" then   register /= stack.pop
    when "MOD" then   register %= stack.pop
    when "POP" then   register = stack.pop
    when "PRINT" then puts register
    else              register = command.to_i
    end
  rescue ZeroDivisionError
    return p "Cannot Divide By Zero (exception raised on command #{idx + 1})"
  rescue TypeError
    return p "The Stack is Empty (exception raised on command #{idx + 1})"
  end
  nil
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

minilang('PRINT')
# 0
puts "\n"
minilang('5 PUSH 3 MULT PRINT')
# 15
puts "\n"
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts "\n"
minilang('5 PUSH POP PRINT')
# 5
puts "\n"
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts "\n"
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts "\n"
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts "\n"
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts "\n"
minilang('6 PUSH')



