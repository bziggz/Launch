number = 0

until number == 10
  number += 1
  next if number % 2 != 0 # odd?
  puts number

end
