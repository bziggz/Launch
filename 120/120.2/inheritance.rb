# 1)

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

karl = Bulldog.new
puts karl.speak
puts karl.swim

# 2)

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run
pete.speak

kitty.run
kitty.speak
kitty.fetch

dave.speak

bud.run
bud.swim

# 3)

  # #               Pet
  #             (run, jump)
  # #         /             \
  # #       Dog              Cat
  #   (speak, fetch, swim)   (speak)
  # #   /
  # # Bulldog
  # (swim)

# 4) Method lookup path is the order that the program looks for 
#    methods in, which results in both inheritance and overriding of 
#    methods that share a name


