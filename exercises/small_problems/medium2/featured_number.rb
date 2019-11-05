=begin

SOURCE:

EXTRACT PROBLEM
  FEATURED NUMBER:
    - multiple of 7
    - odd
    - no digits repeat

INPUT
  a number

EXAMPLE
  featured(12) == 21
  featured(20) == 21
  featured(21) == 35
  featured(997) == 1029
  featured(1029) == 1043
  featured(999_999) == 1_023_547
  featured(999_999_987) == 1_023_456_987

  featured(9_999_999_999) !!! ERROR MESSAGE

OUTPUT
  the next featured number

EXPERIMENT / EDGE
  9999999999 is upper edge of range
  negative nums and 0?

ALGO
  GIVEN an integer
  EVALUATE next num with conditional odd? and num % 7 = 0

  RETURN arr[0]
    - ERROR MESSAGE IF arr.empty?

=end

def featured(int)
  num = int + 1

  loop do
    if num.odd? && num % 7 == 0 && num.to_s.chars == num.to_s.chars.uniq
      return num
    elsif num >= 9_876_543_210
      return "There are no remaining featured numbers."
    end

    num += 1
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)