class Cat
  def initialize(n)
    @name = n
  end

  def greet 
    puts "Hello! My name is #{self.name}!"
  end

  def name
    @name
  end
end

kitty = Cat.new('Sophie')
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
end

kitty = Cat.new('Sophie')
kitty.greet