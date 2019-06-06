# good_dog.rb

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def self.what_am_i                  # Class Method definition
#     "I'm a GoodDog class!"
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
# end

# puts GoodDog.what_am_i


# Just as instance variables capture information related to specific instances 
# of classes (i.e., objects), we can create variables for an entire class that are
#  appropriately named class variables. Class variables are created using two @ 
#  symbols like so: @@. Let's create a class variable and a class method to view 
#  that variable.

# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs


# We have a class variable called @@number_of_dogs, which we initialize to 0.
# Then in our constructor (the initialize method), we increment that number by 1.
# Remember that initialize gets called every time we instantiate a new object via
# the new method. This also demonstrates that we can access class variables from
# within an instance method (initialize is an instance method). Finally, we just
# return the value of the class variable in the class method 
# self.total_number_of_dogs. This is an example of using a class variable and
# a class method to keep track of a class level detail that pertains only to 
# the class, and not to individual objects.

# Constants

# When creating classes there may also be certain variables that you never 
# want to change. You can do this by creating what are called constants. 
# You define a constant by using an upper case letter at the beginning of the
# variable name. While technically constants just need to begin with a capital 
#  letter, most Rubyists will make the entire variable uppercase.

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n 
#     self.age = a * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age

# Here we used the constant DOG_YEARS to calculate the age in dog years when 
# we created the object, sparky. Note that we used the setter methods in the 
# initialize method to initialize the @name and @age instance variables given 
# to us by the attr_accessor method. We then used the age getter method to 
# retrieve the value from the object.

# DOG_YEARS is a variable that will never change for any reason so we use a 
# constant. It is possible to reassign a new value to constants but Ruby will 
# throw a warning.


# The to_s Method


# The to_s instance method comes built in to every class in Ruby. In fact, we have been using it all along. For example, suppose we have the GoodDog class from above, and the sparky object as well from above.

# puts sparky      # => #<GoodDog:0x007fe542323320>


# What's happening here is that the puts method automatically calls to_s on its argument, which in this case is the sparky object. In other words puts sparky is equivalent to puts sparky.to_s. The reason we get this particular output lies within the to_s method in Ruby. By default, the to_s method returns the name of the object's class and an encoding of the object id.

# To test this, we can add a custom to_s method to our GoodDog class, overriding the default to_s that comes with Ruby.


# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end

# sparky = GoodDog.new("Sparky", 4)

# puts sparky
# p sparky

# More About Self

# So far we've seen two clear use cases for self:

# 1) Use self when calling setter methods from within the class. In our earlier
# example we showed that self was necessary in order for our change_info method
# to work properly. We had to use self to allow Ruby to disambiguate between
# initializing a local variable and calling a setter method.

# 2) Use self for class method definitions.

# Let's play around with self to see why the above two rule work. Let's
# assume the following code:

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     self.name   = n
#     self.height = h 
#     self.weight = w 
#   end

#   def change_info(n, h, w)
#     self.name   = n
#     self.height = h 
#     self.weight = w 
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end

#   def what_is_self
#     self
#   end
# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# p sparky.what_is_self

# This is our standard GoodDog class, and we're using self whenever we call an instance method from within the class. We know the rule to use self, but what does self really represent here? Let's add one more instance method to help us find out.


# From within a class...

# 1) self, inside of an instance method, references the instance (object)
# that called the method - the calling object. Therefore, self.weight= is the
# same as sparky.weight= in our example

# 2) self, outside of an instance method, references the class and can be used
# to define class methods. Therefore, def self.name=(n) is the same as
# def GoodDog.name=(n), in our example.


# Exercises

# 1) Add a class method to your MyCar class that calculates the gas milage 
# of any car

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
  end

  def self.gas_milage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and speed up #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the brake and slow down #{number} mph."
  end

  def shut_off
    @speed = 0
    puts "Let's park this bad boy!"
  end

  def current_speed
    "Your current speed is #{@speed}"
  end

  def to_s
    "My car is a #{color} #{year} #{@model}!"
  end
end

car = MyCar.new(2004, "Buick Regal", "gold")
puts car.color
car.spray_paint("Mahogany")
puts car.color
MyCar.gas_milage(13, 351)
puts car



# When running the following code...

# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"
# puts bob.name

# We get the following error...

# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

# Why do we get this error and how to we fix it?








