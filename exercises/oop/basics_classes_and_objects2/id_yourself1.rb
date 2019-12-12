class Cat
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify