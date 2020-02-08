def step(from, to, step)
  arr = [from]

  until arr[-1] >= to
    arr << arr[-1] + step
  end

  arr.each { |x| yield(x) }
end

step(1, 10, 3) { |value| puts "value = #{value}" }