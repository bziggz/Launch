# START
# GIVEN an integer
# PRINT a right triangle made of *
#   the two sides == integer
#   the vertical side is right-justified
# END

def upper_right(num)
  count = num - 1

  num.times do
    puts (" " * count) + ("*" * (num - count))
    count -= 1    
  end
end

def lower_right(num)
  count = 0

  num.times do
    puts (" " * count) + ("*" * (num - count))
    count += 1    
  end
end

def upper_left(num)
  count = 1

  num.times do
    puts ("*" * count)
    count += 1    
  end
end

def lower_left(num)
  count = num

  num.times do
    puts ("*" * count)
    count -= 1    
  end
end

def triangle(num, orientation)
  case orientation
  when 1 then upper_left(num)
  when 2 then upper_right(num)
  when 3 then lower_right(num)
  when 4 then lower_left(num)
  end
end

triangle(6, 1)
triangle(5, 2)
triangle(7, 3)
triangle(9, 4)



