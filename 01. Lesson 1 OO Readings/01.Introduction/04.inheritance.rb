# Inheritance

# Inheritance is when a class inherits behavior from another class.



# class MyCar
#   attr_accessor :color
#   attr_reader :year

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @speed = 0
#   end

#   def self.gas_milage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your new #{color} paint job looks great!"
#   end

#   def speed_up(number)
#     @speed += number
#     puts "You push the gas and speed up #{number} mph."
#   end

#   def brake(number)
#     @speed -= number
#     puts "You push the brake and slow down #{number} mph."
#   end

#   def shut_off
#     @speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def current_speed
#     "Your current speed is #{@speed}"
#   end

#   def to_s
#     "My car is a #{color} #{year} #{@model}!"
#   end
# end

# car = MyCar.new(2004, "Buick Regal", "gold")
# puts car.color
# car.spray_paint("Mahogany")
# puts car.color
# MyCar.gas_milage(13, 351)
# puts car



# Class Inheritance
# Here, we're extracting the speak method to a superclass Animal, and we use inheritance to make that behavior available to GoodDog and Cat classes.

# good_dog_classes.rb

# class Animal
#   def speak
#     puts "Hello!"
#   end
# end

# class GoodDog < Animal
# end


# class Cat < Animal
# end

# sparky = GoodDog.new
# paws = Cat.new
# puts sparky.speak
# puts paws.speak

# We use the < symbol to signify that the GoodDog class is inheriting from the Animal class. This means that all of the methods in the Animal class are available to the GoodDog class for use. We also created a new class called Cat that inherits from Animal as well. We've eliminated the speak method from the GoodDog class in order to use the speak method from Animal.

# When we run this code we see the correct output. Both classes are now using the superclass Animal's speak method.

# But what if we want to use the original speak method from the GoodDog class only. Let's add it back and see what happens.

# good_dog_class.rb

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(n)
#     self.name = n
#   end

#   def speak
#     "#{self.name} says arf!"
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new("Sparky")
# paws = Cat.new

# puts sparky.speak
# puts paws.speak

# In the GoodDog class, we're overriding the speak method in the Animal class because Ruby checks the object's class first for the method before it looks in the superclass. So, that means when we wrote the code sparky.speak, it first looked at sparky's class, which is GoodDog. It found the speak method there and used it. When we wrote the code paws.speak, Ruby first looked at paws's class, which is Cat. It did not find a speak method there, so it continued to look in Cat's superclass, Animal. It found a speak method in Animal, and used it. We'll talk about this method lookup path more in depth in a bit.

# Inheritance can be a great way to remove duplication in your code base. There is an acronym that you'll see often in the Ruby community, "DRY". This stands for "Don't Repeat Yourself". It means that if you find yourself writing the same logic over and over again in your programs, there are ways to extract that logic to one place for reuse.

# super

# class Animal
# attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end


# class GoodDog < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# p bruno = GoodDog.new("brown")
# p BadDog.new(2, "bear")


# This is similar to our previous example, with the difference being that super takes an argument, hence the passed in argument is sent to the superclass. Consequently, in this example when a BadDog class is created the passed in name argument ("bear") is passed to the superclass and set to the @name instance variable.

# Mixing in Modules

# Another way to DRY up your code in Ruby is to use modules. We've already seen a little bit of how to use modules, but we'll give a few more examples here.

# Extracting common methods to a superclass, like we did in the previous section, is a great way to model concepts that are naturally hierarchical. We gave the example of animals. We have a generic superclass called Animal that can keep all basic behavior of all animals. We can then expand on the model a little and have, perhaps, a Mammal subclass of Animal. We can imagine the entire class hierarchy to look something like the figure below.

# The above diagram shows what pure class based inheritance looks like. Remember the goal of this is to put the right behavior (i.e., methods) in the right class so we don't need to repeat code in multiple classes. We can imagine that all Fish objects are related to animals that live in the water, so perhaps a swim method should be in the Fish class. We can also imagine that all Mammal objects will have warm blood, so we can create a method called warm_blooded? in the Mammal class and have it return true. Therefore, the Cat and Dog objects will have access to the warm_blooded? method which is automatically inherited from Mammal by the Cat and Dog classes, but they won't have access to the methods in the Fish class.

# This type of hierarchical modeling works, to some extent, but there are always exceptions. For example, we put the swim method in the Fish class, but some mammals can swim as well. We don't want to move the swim method into Animal because not all animals swim, and we don't want to create another swim method in Dog because that violates the DRY principle. For concerns such as these, we'd like to group them into a module and then mix in that module to the classes that require those behaviors. Here's an example:

module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable       # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable        # mixing in Swimmable module
end

#  And now Fish and Dog objects can swim, but objects of other classes won't be able to:

sparky = Dog.new 
neemo = Fish.new
paws = Cat.new

p sparky.swim
p neemo.swim
p paws.swim


# Using modules to group common behaviors allows us to build a more powerful, flexible and DRY design.

# Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling. You can see this convention with our Swimmable module. Likewise, we could name a module that describes "walking" as Walkable. Not all modules are named in this manner, however, it is quite common.


# Inheritance vs Modules

# Now that you know the two primary ways that Ruby implements inheritance, class inheritance and mixing in modules, you may wonder when to use one vs the other. Here are a couple of things to remember when evaluating those two choices.

# You can only subclass from one class. But you can mix in as many modules as you'd like.
# If it's an "is-a" relationship, choose class inheritance. If it's a "has-a" relationship, choose modules. Example: a dog "is an" animal; a dog "has an" ability to swim.
# You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.
# As you get better at OO design, you'll start to develop a feel for when to use class inheritance versus mixing in modules.















































