class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  WHEELS = 4
end

class Motorcycle < Vehicle
  WHEELS = 2
end

class Truck < Vehicle
  attr_reader :payload
  WHEELS = 6

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def to_s
    "#{make} #{model} with a #{payload} payload"
  end
end

taurus = Car.new(2007, "taurus")
ranger = Truck.new(1995, "ranger", "1 ton")
ducati = Motorcycle.new(1999, "ducati")

puts taurus
puts ranger
puts ducati
