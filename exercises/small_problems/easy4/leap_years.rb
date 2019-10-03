# evenly divisible by 4, unless the year is also divisible by 100.
# not If evenly divisible by 100,  unless evenly divisible by 400.

def leap_year?(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  return true if year % 4 == 0
  false
end

def reverse_leap_year?(year)
  if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    true
  else
    false
  end
end

def julian_leap_year?(year)
  year < 1752 ? year % 4 == 0 : leap_year?(year)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

puts"\n"

p reverse_leap_year?(2016) == true
p reverse_leap_year?(2015) == false
p reverse_leap_year?(2100) == false
p reverse_leap_year?(2400) == true
p reverse_leap_year?(240000) == true
p reverse_leap_year?(240001) == false
p reverse_leap_year?(2000) == true
p reverse_leap_year?(1900) == false
p reverse_leap_year?(1752) == true
p reverse_leap_year?(1700) == false
p reverse_leap_year?(1) == false
p reverse_leap_year?(100) == false
p reverse_leap_year?(400) == true

puts "\n"

p julian_leap_year?(2016) == true
p julian_leap_year?(2015) == false
p julian_leap_year?(2100) == false
p julian_leap_year?(2400) == true
p julian_leap_year?(240000) == true
p julian_leap_year?(240001) == false
p julian_leap_year?(2000) == true
p julian_leap_year?(1900) == false
p julian_leap_year?(1752) == true
p julian_leap_year?(1700) == true
p julian_leap_year?(1) == false
p julian_leap_year?(100) == true
p julian_leap_year?(400) == true


