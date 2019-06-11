# Lecture: Collaborator Objects

# class Person
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end
# end

# joe = Person.new("Joe")
# joe.name





# class Person
#   attr_accessor :name, :pet

#   def initialize(name)
#     @name = name
#   end
# end

# class Bulldog; end

# bob = Person.new("Robert")
# bud = Bulldog.new
# p bob.pet
# bob.pet.class


class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Cat
  def swim
    "I can't."
  end
end

class Bulldog
  def weight
    "I'm fat"
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud
p bob.pets

































