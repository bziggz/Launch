a = [1, 2, 3]

def mutate(array)
  array.pop
end

puts "Before mutate method: #{a}"
p mutate(a)
p "After mutate method: #{a}"

puts "\n"
puts "\n"

b = [4, 5, 6]

def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{b}"
no_mutate(b)
p "After no_mutate method: #{b}"