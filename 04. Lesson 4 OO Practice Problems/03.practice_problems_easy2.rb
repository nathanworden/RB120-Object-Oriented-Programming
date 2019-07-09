# Question 1
# You are given the following code:

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
# What is the result of calling

# oracle = Oracle.new
# p oracle.predict_the_future

# The result will be

# "You will [one of the choices in the 'choices' array]"

# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end
# What is the result of the following:

# trip = RoadTrip.new
# p trip.predict_the_future

# "You will <something>" taken from a samping of the choices in RoadTrip


# Question 3


# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# # orange = Orange.new
# # hot_sauce = HotSauce.new

# p Orange.ancestors
# # Orange
# # Taste
# # Object
# # Kernal
# # Basic Object

# Question 4
# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

# class BeesWax
# attr_accessor :type

#   def initialize(type)
#     @type = type
#   end

#   # def type
#   #   @type
#   # end

#   # def type=(t)
#   #   @type = t
#   # end

#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end

# wax = BeesWax.new("jar")
# wax.describe_type



# Question 6
# self.manufacturer
# You know because of the 'self' in the method definition
# You would call it like this:
# Television.manufacturer


# Question 7
# If we have a class such as the one below:

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#     puts @@cats_count
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end
# # Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# # @@cats_count is a class variable. Every time a new instance
# # of cat is initalized, the @@cats_count class variable is 
# # incremented by 1. 

# jerry = Cat.new('tabby')
# Cat.new('bald')

# p Cat.cats_count

# Question 8
# If we have this class:

# class Game
#   def play
#     "Start the game!"
#   end
# end
# # And another class:

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end
# # What can we add to the Bingo class to allow it to inherit the play method from the Game class?

# bingo = Bingo.new

# p bingo.play



# Question 9
# If we have this class:

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end

#   def play
#     puts "OOOOOOO BABY PLAY!"
#   end
# end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.


# game_of_bingo = Bingo.new
# game_of_bingo.play

# Calling #play on game_of_bingo will call Bingo::play as opposed
# to Game::play because of the lookup pattern in Ruby.


# Question 10

# Polymorphism - "Many Forms". Repurposing code for different use cases
# Encapsulation - Hiding parts of the code from the rest of the program
#               So that only the parts to interact with it are exposed.
# Reducing the dependencies in code so that when one thing is changed there
#               isn't a cascade of errors.
# Reducing the complexity.


# Encapsulation - Hiding pieces of functionality and making it unavailable to
#                 the rest of the code base.
#                  - A form of data protection, so that dta cannot be manipulated
#                  or changed without obvious intention.
#                  - It is what defines the boundaries in your application and 
#                  allows your code to achieve new levels of complexity.
#                  - Ruby accomplishes this task by creating objects, and exposing
#                  interfaces (i.e. methods) to interact with those objects.
#                  - Allows the programmer to think on a new level of abstraction. 
#                  Objects are represented as real-world nouns and can be given methods
#                  that describe the behavior the programmer is trying to represent.


# Book Answer:
#  1. Creating objects allows programmers to think more abstractly about the code they are writing.
#  2. Objects are represnted by nouns so they are easier to conceptulize.
#  3. It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
#  4. It allows us to easily give functionality to different parts of an application without duplication.
#  5. We can build applicatons faster as we can reuse pre-written code.
#  6. As the software becomes more complex this complexity can be more easily managed.

















