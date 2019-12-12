class Cat
  def self.generic_greeting
    "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new

puts kitty.class.generic_greeting