def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

puts compute(5) { |arg| arg + 3 }

compute("Hello") { |str| puts str + " world." }

puts compute(45)