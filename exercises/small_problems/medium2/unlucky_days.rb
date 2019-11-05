# SOURCE:

# EXTRACT PROBLEM

# INPUT
#  - a year(integer)

# EXAMPLE
#   friday_13th(2015) == 3
#   friday_13th(1986) == 1
#   friday_13th(2019) == 2

# OUTPUT
#   how many friday 13's there are in 

# EXPERIMENT / EDG
#  none - asssume year is post - 1752

# ALGO
#   GIVEN an integer(year)
#   CREATE a list of months [1-12]
#   create count = 0
#   FOR EACH month, 
#     CALL #date and retrieve day of the 13th
#     IF day == friday, count += 1
#     end

#   RETURN count

require 'date'

def friday_13th(year)
  months = (1..12).to_a
  count = 0

  months.each do |month| 
    if Date.new(year, month, 13).friday?
      count += 1 
    end
  end

  count
end

def five_fridays(year)
  months = {
    1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0,
    7=>0, 8=>0, 9=>0, 10=>0, 11=>0, 12=>0
  }

  date = Date.new(year, 1, 1)

  until date.year > year
    months[date.mon] += 1 if date.friday?
    date = date.next_day
  end

  months.values.count(5)
end


p five_fridays(2015)


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2