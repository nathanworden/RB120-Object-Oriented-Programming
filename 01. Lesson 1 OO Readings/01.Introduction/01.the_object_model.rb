# Object Oriented Programming is a programming paradigm that 
# was created to deal with the growing complexity of large
# software systems. Programmers found out very early on that
# as applications grew in complexity and size, they became 
# very difficult to maintain. One small change at any point
# in the program would trigger a ripple effect of errors due
# to dependencies throughout the entire program.

# Programmers needed a way to create containers for data that
# could be changed and manipulated without affecting the entire
# program. They needed a way to section off areas of code that
# performed certain procedures so that their programs could become 
# the interaction of many small parts, as opposed to one massive
# blob of dependency.

# Encapsulation is hiding pieces of functionality and making 
# it unavailable to the rest of the code base. It is a form
# of data protection, so that data cannot be manipulated or
# changed without obvious intention. It is what defines the 
# boundaries in your application and allows your code to achieve
# new levels of complexity. Ruby, like many other OO languages,
# accomplishes this task by creating objects, and exposing 
# interfaces (i.e. methods) to interact with those objects.

# Another benefit of creating objects is that they allow the
# programmer to think on a new level of abstrction. Objects
# are represented as real-world nouns and can be given methods
# that describe the behavior the programmer is trying to represent

# Polymorphism is the ability for data to be represented as many
# different types. "Poly" stands for "many" and "morph" stands
# for "forms". OOP gives us flexibility in using pre-written
# code for new purposes.

# The concept of inheritance is used in Ruby where a class 
# inherits the behaviors of another class, referred to as the
# superclass. This gives Ruby programmers the power to define basic
# classes with large reusibility and smaller subclasses
# for more fine-grained, detailed behaviors.

# Another way to apply polymorphic structure to Ruby programs is
# to use a Module. Modules are similar to classes in that they 
# contain shared behavior. However, you cannot create an
# object with a module. A module must be mixed in with a class
# using the include method invocation. This is called a mixin.
# After mixing in a module, the behaviors declared in that module
# are available to the class and its objects.

# What are Objects?

# Throughout the Ruby community you'll often hear the phrase,
# "In Ruby, everything is an object!". We've avoided this
# reality so far because objects are a more advanced topic
# and it's necessary to get a handle on basic Ruby syntax before
# you start thinking about objects.

# But it's true; everything in Ruby is an object. Objects are
# created from classes. Think of classes as molds and objects as
# the things you produce out of those molds. Individual objects
# will contain different information from other objects, yet
# they are instances of the same class. Here's an example of 
# two objects of the String class:

# p "hello".class
# p "world".class


# In the above example, we use the class instance method to 
# determine what the class is for each object. As you can see,
# everything we've been using, from strings to integers, are
# in fact objects, which are instantiated from a class. We'll
# dig deeper into this very soon.

# Class Define Objects

# Ruby defines the attributes and behaviors of its objects in 
# classes. You can think of classes as basic outlines of what an
# object should be made of and what it should be able to do.
# To define a class, we use syntax similar to defining a method.
# We replace the def with class and use the CamelCase naming
# convention to create the name. We then use the CamelCase 
# naming convention to create the name. We then use the reserved
# word end to finish the definition. Ruby file names should be
# in snake_case, and reflect the calss name. So in the below
# example, the file name is good_dog.rb and the class name is 
# GoodDog.


# good_dog.rb

# class GoodDog
# end

# sparky = GoodDog.new

# In the above example, we created an instance of our GoodDog
# class and stored it in the variable sparky. We now have an
# object. We say that sparky is an object or instance of class
# GoodDog. This entire workflow of creating a new object or 
# instance from a class is called instantiation, so we can
# also say that we've instantiated an object called sparky 
# from the class GoodDog. The terminology in OOP is something
# you'll eventually get used to, but the important fact here
# is that an object is returned by calling the class method 
# new. Take a look at Figure 3 to visualize what we're doing.

# # Defining and creating a new instance of a basic class is
# # simple. But before we go any further showing you how to create
# # more elaborate classes, let's talk about modules briefly.

# Modules

# As we mentioned earlier, modules are another way to achieve
# polymorphism in Ruby. A module is a collection of behaviors
# that is useable in other classes via mixins. A module is
# "mixed in" to a class using the include method invocation.
# Let's say we wanted our GoodDog class to have a speak
# method but we have other classes that we want to use
# a speack method with too. Here's how we'd do it.

# good_dog.rb

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end


sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")

# Note that in the above example, both the GoodDog object,
# which we're calling sparky, as well as the Human Being object,
# which we're calling bob, have access to the speak instance 
# method. This is possible through "mixing in" the module
# Speak. It's as if we copy-pasted the speak method into the
# GoodDog and HumanBeing classes

# Method Lookup

# When you call a method, how does Ruby know where to look 
# for that method? Ruby has a distinctt lookup path that it
# follows each time a method is called. Let's use our program
# from above to see what the method lookup path is for our
# GoodDog class. We can use the ancestors method on any class
# to find out the method lookup chain.

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors


# The Speak module is placed right in between our custom 
# classes (i.e., GoodDog and HumanBeing) and the Object class
# that comes with Ruby. In Inheritance you'll see how the 
# method lookup chain works when working with both mixins
# and class inheritance.

# This means that since the speak method is not defined in 
# the GoodDog class, the next place it looks is the Speak
# module. This continues in an ordered, linear fashion,
# until the method is either found, or there are no more places
# to look.

# Summary

# That was a very quick overview of OOP in Ruby. We'll spend the 
# next couple of chapters diving into the details.

# Exercises

# 1) How do we create an object in Ruby? Give an example of the
# creation of an object.


# class Student

# end


# HarryPotter = Student.new

# Solution:
# We create an object by defining a class and instantiating
# it by using the .new method to create an instance, also
# known as an object.

# 2) What is a module? What is its purpose? How do we use them
# with our classes? Create a module for the class you created
# in exercise 1 and include it properly. 

# A module allows us to group reusable code into one place.
# We use modules in our classes by using the include reserved
# word, followed by the module name. Modules are also used
# as a namespace.

# A module is a collection of behaviors that is usable in
# other classes via mixins.
# Modules are a way to achieve polymorphism in Ruby

module Speak
  def speak(sound)
    puts sound
  end
end

module Outer
  class Student
    include Speak
  end
end

my_obj = Outer::Student.new

HarryPotter = Outer::Student.new
HarryPotter.speak("I'm a wizard!")






























