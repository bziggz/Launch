1.step(to: 99, by: 2) { |num| puts num}

puts (1..99).select { |x| x % 2 == 1 }