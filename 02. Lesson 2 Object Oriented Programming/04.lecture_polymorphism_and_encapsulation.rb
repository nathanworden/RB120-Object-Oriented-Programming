# Lecture: Polymorphism and Ensapsulation

# Polymorphism refers to the ability of different objects to respond in 
# different ways to the same method (or method invocation)

# Polymorphism refers to the ability of different objects to respond in 
# different ways to the same method (or method invocation)

# Polymorphism is the ability for different objects to respond in deifferent
# ways to to the same method (or method invocation)

# Polymorphism is the ability for different objects to respond in different
# ways to the same method (or method invocation)

# Polymorphism is the ability for different objects to respond in different
# ways to the same method (or method invocation)

# class Animal
#   def eat
#     # generic eat method
#   end
# end

# class Fish < Animal
#   def eat
#     # eating specific to fish
#   end
# end

# class Cat < Animal
#   def eat
#      # eat implementation for cat
#   end
# end

# def feed_animal(animal)
#   animal.eat
# end

# array_of_animals = [Animal.new, Fish.new, Cat.new]
# array_of_animals.each do |animal|
#   feed_animal(animal)
# end

# Looking at this example, we can see that every object in the array is a different animal, but the client code can treat them all as a generic animal, i.e., an object that can eat. Thus, the public interface lets us work with all of these types in the same way even though the implementations can be dramatically different. That is polymorphism in action.

# class Wedding
#   attr_reader :guests, :flowers, :songs

#   def prepare(preparers)
#     preparers.each do |preparer|
#       preparer.prepare_wedding(self)
#     end
#   end
# end

# class Chef
#   def prepare_wedding(wedding)
#     prepare_food(wedding.guests)
#   end

#   def prepare_food(guests)
#     #implementation
#   end
# end

# class Decorator
#   def prepare_wedding(wedding)
#     decorate_place(wedding.flowers)
#   end

#   def decorate_place(flowers)
#     # implementation
#   end
# end

# class Musician
#   def prepare_wedding(wedding)
#     prepare_performance(wedding.songs)
#   end

#   def prepare_performance(songs)
#     #implementation
#   end
# end

# We can see that there is no inheritance in this example, but we still have polymorphism. Each class must define a prepare_wedding method and implement it in its own way. If we must add another preparer, we can create another class and just implement prepare_wedding to perform the appropriate actions.

# Encapsulation
# Encapsulation lets us hide the internal representation of an object
# from outside and only expose the methods and properties that users
# of the object need. We expose these properties and methods through
# the public interface of a class: its public methods.

# Encapsulation lets us hide the internal representation of an object
# from outside and only expose the methods and properties that users of
# the object need. We expose these properties and methods through the 
# public interface of a class: its public methods.


# Encapsulation lets us hide the internal representation of an object 
# from outside and only exposes the methods and properties that uers of
# the object need. We expose these properties and methods throug the
# public interface of a class: its public methods.

# Encapsulation lets us hide the internal representation of an object 
# from the outside and only expose the methods and properties that users of
# the objet need. We expose these properties and methods through the 
# public interface of the class: its public methods.

# Encapsulation lets us hide the internal representation of an object from
# the outside and only expose the methods and proeprties that uers of the 
# object need. We expose these properties and methods through the public
# interface of a class: its public methods.

# Encapsulation lets us hide the internal reresentation of the object
# from the outside and only exposes the methods and proeprties that users of 
# the objet need. We expose these properties and methods thorugh the public
# interface of a class: its public methods.

# Encapulation lets us hide the internal representation of an object from 
# the outside and only exposes the methods and properties that users of
# the object need. We expose these properties and methods through the public
# interface of a class: its punlic methods.

# Encapsulation lets us hide the internal representation of the class from
# the outside and only exposes the methods and proeprties that users of the 
# object need. We expose these properties and methods through the public
# interface of a class: its public methods.


# Let's look at an example of this:

class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
puts dog.greeting
dog.change_nickname('barny')
puts dog.greeting


















































