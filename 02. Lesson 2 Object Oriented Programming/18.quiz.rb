## Quiz

# Question 1

# class Cat
#   @@total_cats = 0
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{@name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end
# end

# mitzi = Cat.new('Mitzi')
# p mitzi.jump # => "Mitzi is jumping!"
# p Cat.total_cats # => 1
# p "The cat's name is #{mitzi.name}" # => "The cat's name is Mitzi"

# class Cat
#   @@total_cats = 0
#   attr_reader :name

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end

#   def to_s
#     @name
#   end
# end

# mitzi = Cat.new('Mitzi')
# p mitzi.jump # => "Mitzi is jumping!"
# p Cat.total_cats # => 1
# p "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"



# Question 2


# class Student
#   def initialize(name, grade=nil)
#     @name = name
#     @grade = grade
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">


# Question 3

# class Student
#   # assume that this code includes an appropriate #initialize method
# end

# jon = Student.new('John', 22)
# jon.name # => 'John'
# jon.name = 'Jon'
# jon.grade = 'B'
# jon.grade # => 'B'


# Question 4

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name # => "Sir Gallant"
# p sir_gallant.speak # => "Sir Gallant is speaking."


# Question 5

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Thief < Character
#   def speak
#     "#{name} is whispering..."
#   end
# end

# sneak = Thief.new("Sneak")
# p sneak.name # => "Sneak"
# p sneak.speak # => "Sneak is whispering..."


# Questioun 6

# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow #< FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"


# Question 7


























