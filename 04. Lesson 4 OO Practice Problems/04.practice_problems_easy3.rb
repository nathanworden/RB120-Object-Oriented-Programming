# # Question 1
# # If we have this code:

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# # What happens in each of the following cases:

# # case 1:
# hello = Hello.new
# hello.hi
# # => "Hello"

# # # case 2:
# hello = Hello.new
# # hello.bye
# # => NoMethodError

# # # case 3:
# hello = Hello.new
# # hello.greet
# # ArgumentError because no message was passed in

# # # case 4:
# hello = Hello.new
# hello.greet("Goodbye")
# # "Goodbye"

# # # case 5:
# Hello.hi
# # Error because Hello:hi is an instance method and ya dumb dumbs called it 
# # on the class


# Question 2
# In the last question we had the following classes:

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def self.hi
#     greeting = Greeting.new
#     greeting.greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end
# If we call Hello.hi we get an error message. How would you fix this?

# fix it by turning hi into a class method like this:
# def self.hi
#   greet("Hello")
# end

# Hello.hi


# Question 3


# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class, both with separate names and ages?

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# pacus = AngryCat.new(6, "Pacus")
# anabell = AngryCat.new(14, "Annabell")
# # pacus.name
# # anabell.name
# # pacus.age
# "Pacus is #{pacus.age} years old"
# # pacus.hiss


# Question 4
# Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

# class Cat
#   attr_reader :type
#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     puts "I am a #{type} cat"
#   end
# end
# # How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

# tabby = Cat.new("tabby")

# tabby.to_s

# Question 5
# If I have the following class:

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# # What would happen if I called the methods like shown below?

# tv = Television.new
# tv.manufacturer # Error
# tv.model # it would run tv:model

# Television.manufacturer # It would run Television::manufacturer
# Television.model # Error


# Question 6
# If we have a class such as the one below:

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end
# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

# use @age

# Question 7
# What is used in this class but doesn't add any value?

# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def self.information
#     return "I want to turn on the light with a brightness level of super high and a color of green"
#   end

# end


# self.infomration doesn't utilize the getter or setter of :brightness or :color
# If you aren't going to use them, then you don't need to initialize
# brightness or color or have an attr_accessor for them.










