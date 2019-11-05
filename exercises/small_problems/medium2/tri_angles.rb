=begin

SOURCE:

EXTRACT PROBLEM
  right One angle of the triangle is a right angle (90 degrees)
  acute All 3 angles of the triangle are less than 90 degrees
  obtuse One angle is greater than 90 degrees.
  invalid if angles.sum != 180 or any angle = 0

INPUT
  three nums, reach representing the angles of a triangle

EXAMPLE
  triangle(60, 70, 50) == :acute
  triangle(30, 90, 60) == :right
  triangle(120, 50, 10) == :obtuse
  triangle(0, 90, 90) == :invalid
  triangle(50, 50, 50) == :invalid

OUTPUT
  a symbol (:acute, :right, :obtuse, :invalid)

EXPERIMENT / EDGE

ALGO
  GIVEN three nums as angles
  CONVERT to array for easier tracking and scanning
  CHECK validity
    no angle  == 0, and angles sum == 180
    RETURN :invalid if false
  IF VALID
    ACUTE if all angles are less than 90
    OBTUSE if any angle is > 90
=end

def valid_triangle?(triangle_array)
  triangle_array.sum == 180 && !triangle_array.include?(0)
end

def triangle(angle1, angle2, angle3)
  triangle_array = [angle1, angle2, angle3]

  return :invalid unless valid_triangle?(triangle_array)

  case 
  when triangle_array.max > 90 then :obtuse
  when triangle_array.max < 90 then :acute
  else
    :right
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid