# 1) Ben is, since balance is now a getter method

# 2) no setter method. add one or change attr_reader to attr_accessor
#     or prepend quantity with @

# 3) it exposes quantity and product_name to public setting

# 4)

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello!")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye!")
  end
end

# 5) 

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def filling_type
    @filling_type ? @filling_type : "Plain" 
  end

  def glazing
    @glazing ? "with #{@glazing}" : ''
  end

  def to_s
    "#{filling_type} #{glazing}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

# 6) they're both the same implementation. the selfs in ex 2 are unnecessary

# 7) remove "light_" from the method name, so it reads Light.information when called.


