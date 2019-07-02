# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def dog_name
#     "bark! bark! #{@name} bark! bark!"
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name

################################################

# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def initialize(name); end

#   def dog_name
#     "bark! bark! #{@name} bark! bark!"
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name

################################################

# module Swim
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swim

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# teddy.enable_swimming
# p teddy.swim

################################################

# class Animal
#   @@total_animals = 0

#   def initialize
#     @@total_animals += 1
#   end
# end

# class Dog < Animal
#   def total_animals
#     @@total_animals
#   end
# end

# spike = Dog.new
# p spike.total_animals

################################################

# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# Vehicle.wheels

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# p Motorcycle.wheels
# p Vehicle.wheels

# class Car < Vehicle
# end

# p Car.wheels

################################################

# class Dog
#   LEGS = 4
# end

# class Cat
#   def legs
#     Dog::LEGS
#   end
# end

# kitty = Cat.new
# p kitty.legs

################################################

# class Vehicle
#   WHEELS = 4
# end

# class Car < Vehicle
#   def self.wheels
#     WHEELS
#   end

#   def wheels
#     WHEELS
#   end
# end

# p Car.wheels

# a_car = Car.new
# p a_car.wheels

################################################

module Maintenance
  def change_tires
    "Changing #{WHEELS} tires"
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
p a_car.change_tires
















