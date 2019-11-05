=begin

SOURCE:

EXTRACT PROBLEM
  equilateral: All 3 sides are of equal length
  isosceles: 2 sides are of equal length, while the 3rd is different
  scalene: All 3 sides are of different length
  otherwise invalid if two shorest sides sum isn't > longest side
    or if any side == 0

INPUT
  three nums, reach representing the sides of a triangle

EXAMPLE
  triangle(3, 3, 3) == :equilateral
  triangle(3, 3, 1.5) == :isosceles
  triangle(3, 4, 5) == :scalene
  triangle(0, 3, 3) == :invalid
  triangle(3, 1, 1) == :invalid
OUTPUT
  a symbol (:equilateral, :isosceles, :scalene, :invalid)

EXPERIMENT / EDGE

ALGO
  GIVEN three nums as sides
  CONVERT to array for easier tracking and scanning
  CHECK validity
    no side  == 0, and longest length < other two lengths
    RETURN :invalid if false
  IF VALID
    EQUILATERAL if all sides are equal
    ISOSCELES if only two are equal
    SCALENE if none are equal 
=end

def valid_triangle?(triangle_array)
  !triangle_array.include?(0) &&
    triangle_array.max < triangle_array.sum - triangle_array.max
end

def triangle(side1, side2, side3)
  triangle_array = [side1, side2, side3]

  return :invalid unless valid_triangle?(triangle_array)

  if triangle_array.count(triangle_array.max) == 3
    :equilateral
  elsif triangle_array.count(triangle_array.max) == 2 ||
        triangle_array.count(triangle_array.min) == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
