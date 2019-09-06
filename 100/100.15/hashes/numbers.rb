# LABELED NUMBERS

numbers = {
  high: 100,
  medium: 50,
  low: 10 
}

numbers.each { |key, value| puts "A #{key} number is #{value}."}

puts "\n"

# DIVIDED BY TWO

half_numbers = numbers.map { |k, v| v / 2 }

puts half_numbers

puts "\n"

# LOW, MEDIUM, OR HIGH

low_numbers = numbers.select { |k, v| v < 25 }

puts low_numbers

puts "\n"

# LOW OR NOTHING

numbers.select! { |k, v| v < 25 }

puts numbers


