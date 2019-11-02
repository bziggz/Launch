# GIVEN an integer
# RETURN array of all integers starting with 1..int

def sequence(int)
  return [0] if int == 0
  int > 0 ? (1..int).to_a : (int..-1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

