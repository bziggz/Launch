# SOURCE:

# EXTRACT PROBLEM
#   pass 1 = every switch
#   pass 2 = every other switch
#   pass 3 = every 3rd switch

#   each step is the pass number

#   make int passes 

# INPUT
#   int = number of switched/lights

# EXAMPLE
#   int == 5 => [1, 4]
#   int == 10 => [1, 4, 9]

# OUTPUT
#   an array of the switches in the ON position

# EXPERIMENT / EDGE
#   none, as int must be positive

# ALGO
#   on? 

#   GIVEN an int
#   CREATE a hash of {switch_num => false}
#   DEF method of switching switch  
#     if false then true : if true then false
#   n times
#     if switch-num % pass then switch switch
#   RETURN hash keys if value == true

def switch_switch(position)
  position ? false : true
end

def toggle_switches(num)
  switches = {}

  for i in (1..num)
    switches[i] = false
  end

  1.upto(num) do |i|
    switches.each_pair do |k, v|
      if k % i == 0
        switches[k] = switch_switch(v)
      end
    end
  end

  switches.keep_if { |_, v| v == true }
  switches.keys
end

p toggle_switches(10)