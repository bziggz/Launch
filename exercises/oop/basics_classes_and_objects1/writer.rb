class Cat
  attr_reader :name
  attr_writer :name

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

# OR

class Cat
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end

  def name=(n)
    @name = n
  end
end

