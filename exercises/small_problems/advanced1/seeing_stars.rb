# SOURCE:

# EXTRACT PROBLEM
#   method

# INPUT
#   int: odd integer > 7

# EXAMPLE
#   star(9)

#   *   *   *
#    *  *  *
#     * * *
#      ***
#   *********
#      ***
#     * * *
#    *  *  *
#   *   *   *

# OUTPUT
#   8-pointed star int x int in size

# EXPERIMENT / EDGE
#   none. int will always be odd and greater than 7

# ALGO
#   GIVEN an int
#   ALL lines but middle will have 3 "*"
#   FIRST LINE will have "*" in corners and middle, with (int - 3) / 2 spaces between
#   NEXT line will have "*" in middle, but one of ^^^ spaces moved to outside
#   NEXT will continue moving  spaces outside until "***"
#   NEXT line will be 
#   MIDDLE line will be "*" * int
#   REVERSE OUT

#   CREATE total spaces = int - 3, outer spaces = 0, between spaces = total / 2
#   loop
#     puts #{' ' * outer}"*"#{' ' * between}"*"#{' ' * between}"*"#{' ' * outer}
#     outer += 1
#     between -= 1
#     break after between = 0
#   end
#   puts "*" * int
#   loop 
#     puts #{' ' * outer}"*"#{' ' * between}"*"#{' ' * between}"*"#{' ' * outer}
#     outer -= 1
#     between += 1
#     break after outer = 0


def star(int)
  outer = 0
  between = (int - 3) / 2

  until between < 0
    puts "#{' ' * outer}*#{' ' * between}*#{' ' * between}*#{' ' * outer}"
    outer += 1
    between -= 1
  end

  puts "*" * int

  outer = (int - 3) / 2
  between = 0

  until outer < 0
    puts "#{' ' * outer}*#{' ' * between}*#{' ' * between}*#{' ' * outer}"
    outer -= 1
    between += 1
  end
end

def make_row(grid_size, distance_from_center, dot_num = 2)
  number_of_spaces = distance_from_center
  spaces = ' ' * number_of_spaces
  output = Array.new(dot_num, '*').join(spaces)
  output.center(grid_size + 2)
end

def print_circle(grid_size)
  f_l_line = grid_size / 2 + 2
  puts make_row(grid_size, 0, f_l_line)
  f_l_line.step(grid_size, 2) { |distance| puts make_row(grid_size, distance) }
  (f_l_line / 2).times { puts make_row(grid_size, grid_size) }
  grid_size.step(f_l_line, -2) { |distance| puts make_row(grid_size, distance) }
  puts make_row(grid_size, 0, f_l_line)
end

def print_sine(grid_size)
  f_l_line = grid_size / 2 + 2
  offset = " " * (grid_size + 1)
  puts make_row(grid_size, 0, f_l_line)
  f_l_line.step(grid_size, 2) { |distance| puts make_row(grid_size, distance) }
  (f_l_line / 4).times { puts make_row(grid_size, grid_size) }
  (f_l_line / 4).times { puts offset + make_row(grid_size, grid_size) }
  grid_size.step(f_l_line, -2) { |distance| puts offset + make_row(grid_size, distance) }
  puts offset + make_row(grid_size, 0, f_l_line)
end

print_circle(45)

print_sine(25)

# puts print_row(14, 0, 8)

# puts print_row(14, 8)
# puts print_row(14, 10)
# puts print_row(14, 12)
# puts print_row(14, 14)
# puts print_row(14, 14)
# puts print_row(14, 14)
# puts ' ' * 15 + print_row(14, 14)
# puts ' ' * 15 + print_row(14, 14)
# puts ' ' * 15 + print_row(14, 12)
# puts ' ' * 15 + print_row(14, 10)
# puts ' ' * 15 + print_row(14, 8)

# puts ' ' * 15 + print_row(14, 0, 8)


