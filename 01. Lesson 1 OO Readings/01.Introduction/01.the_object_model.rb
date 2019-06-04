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

p "hello".class
p "world".class


# In the above example, we use the class instance method to 
# determine what the class is for each object. As you can see,
# everything we've been using, from strings to integers, are
# in fact objects, which are instantiated from a class. We'll
# dig deeper into this very soon.

# Class Define Objects

# Ruby defines the attributes and behaviors of its objects in 
# classes.











