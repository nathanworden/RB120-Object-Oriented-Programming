# class Pet
#   attr_reader :name, :species
#   def initialize(species, pet_name)
#     @species = species
#     @name = pet_name
#   end
# end

# class Owner
#   attr_accessor :pets
#   attr_reader :name

#   def number_of_pets
#     pets.size
#   end

#   def initialize(owner_name)
#     @name = owner_name
#     @pets = []
#   end
# end

# class Shelter
#   attr_accessor :adoption_record
#   def initialize
#     @adoption_record = []
#   end

#   def adopt(owner, pet)
#       owner.pets << pet
#       adoption_record << owner unless adoption_record.include?(owner)
#   end

#   def print_adoptions
#     adoption_record.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"
#       owner.pets.each {|pet| puts "a #{pet.species} named #{pet.name}"}
#       puts ""
#     end
#   end
# end

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @owners = {}
    @pets = []
    @orphin = Owner.new('orphin')
  end

  def adopt(owner=@orphin, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

  def add_pet(pet)
    @pets << pet
  end
end




butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('parakeet', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.adopt(asta)


shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


