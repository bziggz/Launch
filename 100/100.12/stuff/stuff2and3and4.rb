# 2) prints and returns nothing, since the block isn't ever called

# 3) instructing your code how to handle exceptions and errors so the 
# program can continue running after an expected unexpected error.

#4) 

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }