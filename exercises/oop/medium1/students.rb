# # Graduate students have the option to use on-campus parking, 
# while Undergraduate students do not.

# # Graduate and Undergraduate students have a name and year
#  associated with them.

class Person
  def initialize
    @age = 0
  end
end

class Student < Person
  def initialize(name, year)
    @name = name
    @year = year
    super()
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end
