numbers = [5, 9, 21, 26, 39]

divisible_by_three = numbers.select { |num| num % 3 == 0 }

p divisible_by_three