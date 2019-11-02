# GIVEN three nums
# CALCULATE average of the nums
# CONVERT result to grade
#   Numerical Score Letter  Grade
#       90 <= score <= 100  'A'
#       80 <= score < 90    'B'
#       70 <= score < 80    'C'
#       60 <= score < 70    'D'
#       0 <= score < 60     'F'
# RETURN grade

def get_average(num1, num2, num3)
  (num1 + num2 + num3) / 3
end

def get_grade(num1, num2, num3)
  avg = get_average(num1, num2, num3)

  grade = case
          when avg < 60 then 'F'
          when avg < 70 then 'D'
          when avg < 80 then 'C'
          when avg < 90 then 'B'
          when avg < 100 then 'A'
          else
            'A+'
          end

  grade
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'
