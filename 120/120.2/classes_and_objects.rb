# 1)

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# 2)

class Person
  attr_accessor :first_name, :last_name

  def initialize(f = '', l = '')
    @first_name = f
    @last_name = l
  end

  def name
    @first_name + ' ' + @last_name
  end
end

# 3)

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    full_name = n.split
    @first_name = full_name.first
    @last_name = full_name.last if full_name.size > 1
  end

  def name
    @first_name + ' ' + @last_name
  end

  def name=(n)
    full_name = n.split
    self.first_name = full_name.first
    self.last_name = full_name.last if full_name.size > 1
  end

  def to_s # added for question 5
    name
  end
end

# 4) 

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts rob.name == bob.name

# 5)

# The person's name is: place-in-memory-gobbledygook

# The person's name is: Robert Smith


