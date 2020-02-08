def count(enum)
  counter = 0
  enum.each { |x| counter += 1 if yield(x) }
  counter
end

def count_fe(enum)
  total = 0
  counter = 0

  while counter < enum.size
    total += 1 if yield(enum[counter])
    counter += 1
  end

  total
end

p count_fe([1,2,3,4,5]) { |value| value.odd? } == 3
p count_fe([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count_fe([1,2,3,4,5]) { |value| true } == 5
p count_fe([1,2,3,4,5]) { |value| false } == 0
p count_fe([]) { |value| value.even? } == 0
p count_fe(%w(Four score and seven)) { |value| value.size == 5 } == 2