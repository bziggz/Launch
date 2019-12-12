class Cat
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty