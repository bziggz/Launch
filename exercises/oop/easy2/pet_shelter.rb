class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Shelter
  attr_reader :owners, :pet, :shelter
  
  def initialize(shelter_name)
    @shelter = Owner.new(shelter_name)
    @owners = [shelter]
  end

  def new_guest_pet(pet)
    shelter.pets << pet
  end

  def adopt(owner, pet)
    if shelter.pets.include?(pet)
      owners << owner unless owners.include?(owner)
      shelter.pets.delete(pet)
      owner.pets << pet
    else
      puts "#{shelter.name} doesn't have a "\
      "#{pet.type} named #{pet.name} in our records."
    end
  end

  def print_adoptions
    owners.each do |owner|
      if owner == shelter && owner.pets.empty?
        puts "#{owner.name} is empty! Yayyyy!!!"
      elsif owner == shelter
        puts "#{owner.name} has the following unadopted pets:"
      else
        puts "#{owner.name} has adopted the following pets:"
      end
  
      owner.pets.each do |pet|
        puts pet
      end
      puts "\n"
    end
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(n)
    @name = n
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

butterscotch  = Pet.new('cat', 'Butterscotch')
pudding       = Pet.new('cat', 'Pudding')
darwin        = Pet.new('bearded dragon', 'Darwin')
kennedy       = Pet.new('dog', 'Kennedy')
sweetie       = Pet.new('parakeet', 'Sweetie Pie')
molly         = Pet.new('dog', 'Molly')
chester       = Pet.new('fish', 'Chester')
asta          = Pet.new('dog', 'Asta')  
laddie        = Pet.new('dog', 'Laddie')
fluffy        = Pet.new('cat', 'Fluffy')
kat           = Pet.new('cat', 'Kat')
ben           = Pet.new('cat', 'Ben')
chatterbox    = Pet.new('parakeet', 'Chatterbox')
bluebell      = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new("The Animal Shelter")

shelter.new_guest_pet(butterscotch)
shelter.new_guest_pet(pudding)
shelter.new_guest_pet(darwin)
shelter.new_guest_pet(kennedy)
shelter.new_guest_pet(sweetie)
shelter.new_guest_pet(molly)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.new_guest_pet(asta)
shelter.new_guest_pet(laddie)
shelter.new_guest_pet(fluffy)
shelter.new_guest_pet(kat)
shelter.new_guest_pet(ben)
shelter.new_guest_pet(chatterbox)
shelter.new_guest_pet(bluebell)

shelter.adopt(phanson, asta)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{shelter.shelter.name} has "\
      "#{shelter.shelter.number_of_pets} unadopted pets."

