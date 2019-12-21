class Pet
  attr_accessor :name, :type

  def initialize
    @type = Dog.new
    @name = type.name
  end
end

class Dog < Pet
  attr_reader :name

  def initialize
    @name = "Seymour"
  end
end



fido = Pet.new
puts fido.name
