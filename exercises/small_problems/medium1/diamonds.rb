# SOURCE:

# EXTRACT PROBLEM

# INPUT
#   an odd integer

# EXAMPLE

# OUTPUT
#    a diamond of int X int size made out of '*'

# EXPERIMENT / EDGE
  
# ALGO
#   GIVEN an integer
#   INIT an array for " "
#   INIT an array for "*"
#   ITERATE over arrays, outputing " " and "*"

def diamond(int)
  space_arr =(int / 2).downto(0).to_a + 1.upto(int / 2).to_a
  star_arr = (1...int).step(2).to_a + (1..int).step(2).to_a.reverse

  space_arr.each_with_index do |num, idx| 
    puts "#{" " * num}#{"*" * star_arr[idx]}"
  end
end

def hollow_diamond(int)
  space_arr =(int / 2).downto(0).to_a + 1.upto(int / 2).to_a
  star_interior_arr = [0] + (1...(int - 2)).step(2).to_a +
                      (1..(int - 2)).step(2).to_a.reverse + [0]

  space_arr.each_with_index do |num, idx|
    if idx == 0 || idx == space_arr.size - 1
      puts "#{" " * num}*"
    else 
      puts "#{" " * num}*#{" " * star_interior_arr[idx]}*"
    end
  end
end

diamond(9)
puts"\n"
diamond(1)
puts "\n"
diamond(3)

hollow_diamond(5)
puts"\n"
hollow_diamond(7)
puts "\n"
hollow_diamond(9)
