# Classes and Objects - Part 1

# States and Behaviors

# As we mentioned earlier, we use classes to create objects.
# When defining a class, we typically focus on two things:
# states and behaviors. States track attributes for individual
# objects. Behaviors are what objects are capable of doing.

# For example, using our GoodDog class from earlier, we may
# want to create two GoodDog objects: one named "Fido" and
# one named "Sparky". They are both GoodDog objects, but may
# contain different information, such as name, weight, and
# height. We would use instance variables to track this 
# information. This should tell you that instance variables
# are scoped at the objeect (or instance) level, and how
# objects keep track of their states.

# Even though they're two different objects, both are still
# objects (or instances) of class GoodDog and contain indentical
# behaviors. For example, both GoodDog objects should be able 
# to bark, run, fetch, and perform other common behaviors of
# good dogs. We define these behaviors as instance methods in
# a class. Instance methods defined in a class are available to
# objects (or instances) of taht class.

# So in summary, instance variables keep track of state, and
# instance methods expose behavior for objects. Let's take a
# closer look at how to define them in a class.

# Initializing a New Object

# We'll still use our GoodDog class from before, but we'll
# be removing the functionality that existed in the previous
# chapter and starting fresh. Let's modify the class by adding
# an initialize method.

# good_dog.rb

# class GoodDog
#   def initialize
#     puts "This object was initialized!"
#   end
# end

# sparky = GoodDog.new 

# The initialize method gets called every time you create a
# new object. That's odd, don't we call the new method when we 
# create an object? Yes, calling the new class method eventually
# leads us to the initialize instance method. We'll talk about
# the difference between class methods and instance methods later.
# In the above example, instantiating a new GoodDog object
# triggered the initialize method and resulted in the string being
# outputted. We refer to the initialze method as a constructor,
# because it gets triggered whenever we create a new object.

# Instance Variables

# So now that we know how to use constructors in Ruby, let's
# create a new object and instantiate it with some stae, like
# a name.

# good_dog.rb

# class GoodDog
#   def initialize(name)
#     @name = name
#   end
# end

# You'll notice something new here. The @name variable looks 
# different because it has the @symbol in front of it. This
# is called an instance variable. It is a variable that exists
# as long as the object instance exists and it is one of the ways
# we tie data to objects. It does not "die" after the initialize
# method is run. It "lives on", to be referenced, until the
# object instance is destroyed. In the above example, our 
# initilize method takes a parameter called name. You can
# pass arguments into the initialize method throug the new
# method. Let's create an object using the GoodDog class
# from above:

# sparky = GoodDog.new("Sparky")

# Here, the string "Sparky" is being passed from the new
# method through to the initialize method, and is assigned
# to the local variable name. Within the constructor (i.e.,
# the initialze method), we then set the instance variable 
# @name to name, which results in assigning the string "Sparky"
# to the @ name instance variable.

# From that example, we can see that instance variables are
# responsible for keeping track of information about the state
# of an object. In the above line of code, the name of the
# sparky object is the string "Sparky". This state for the object
# is tracked in the instance variable, @name. If we created
# another GoodDog object, for example, with 
# fido = GoodDog.new('Fido'), then the @name instance variable
# for the fido object would contain the string "Fido." Every
# object's state is unique, and instance variables are how we
# keep track.

# Instance Methods

# Right now, our GoodDog class can't really do anything.
# Let's give it some behaviors.

# good_dog.rb

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "Arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# sparky.speak

# When you run this program, nothing happens. This is because
# the speak method returned the string "Arf!", but we now
# need to print it out. So we should add puts in front of
# it, like this:

# puts sparky.speak

# Now, we should see the output of our program is the string
# "Arf!". We told sparky to speak and he did. Now, suppose
# we have another GoodDog object:

# fido = GoodDog.new("Fido")
# puts fido.speak

# Our second fido object can also perform GoodDog behaviors. 
# So, again, all objects of the same class have the same 
# behaviors, though they contain different states; here the 
# differing state is the name. 

# What if we wanted to not just say "Arf!", but say "Sparky says
# arf!"? In our instance methods, which is what all the methods
# are so far, we have access to instance variables. So, we can
# use string interpolation and chage our speak method to
# this: (other code omitted)

# good_dog.rb


# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak

# fido = GoodDog.new("Fido")
# puts fido.speak

# And now, we can expose information about the state of the 
# object using instance methods.

# Accessor Methods

# What if we wanted to print out only sparky's name? We could
# try the code below

# puts sparky.name

# However, we get the following error:

# NoMethodError: undefined method `name' for #<GoodDog:0x007f91821239d0 @name="Sparky">

# A NoMethodError means that we called a method that doesn't
# exist or is unavailable to the object. If we want to access
# the object's name, which is sorted in the @name instance
# variable, we have to create a method that will return
# the name. We can call it get_name, and its only job is to 
# return the value in the @name instance varibale.

# good_dog.rb

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def get_name
#     @name
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.get_name

# Ok, we've added our get_name method and it should return
# the value of our @name instance variable. Let's run this
# code and see if it works.

# This is what we get back.

# Sparky says arf!
# Sparky

# It worked! We now have a getter method. But what if we 
# wanted to change sparky's name? That's when we reach for 
# a setter method. It looks a lot like a getter method but 
# with one small difference. Let's add it.

# good_dog.rb

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def get_name
#     @name
#   end

#   def set_name=(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.get_name
# sparky.set_name = "Spartacus"
# puts sparky.get_name

# The output of this code is:

# Sparky says aarf!
# Sparky
# Spartacus

# As you can see, we've successfully changed sparky's name to
# the string "Spartacus". The first thing you should notice about
# the setter method set_name= is that Ruby gives us a special
# syntax to use it. To use the set_name= method normally, we
# would expect to do this: sparky.set_name=("Spartacus"),
# where the entire "set_name=" is the method name, and the string
# "Spartacus" is the argument being passed in to the method.
# Ruby recognizes that this is a setter method and allows us 
# to use the more natural assignment syntax: sparky.set_name = "Spartacus".
# When you see this code, just realize there's a method caleld
# set_name= working behind the scenes, and we're just seeing
# some Ruby  syntactical sugar.

# Finally, as a convention, Rubyists typically want to name
# those getter and setter methods using the same name as the
# instance variabel they are exposing and setting. We'll make
# the change to our code as well:


# good_dog.rb

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def name                   # This was renamed from "get_name"
#     @name
#   end

#   def name=(n)              # This was renamed from "set_name="
#     @name = n
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.name            # => "Sparky"
# sparky.name = "Spartacus"
# puts sparky.name            # = "Spartacus"

# You'll notice that writing those getter and setter methods
# took up a lot of room in our program for such a simple 
# feature. And if we had other states we wanted to track, like
# height or weight, the class would be even longer. Because
# these methods are so commonplace, Ruby has a built-in way
# to automatically create these getter and setter methods for
# us, using the attr_accessor method. Check out this 
# refactoring of the code from above.

# good_dog.rb

# class GoodDog
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.name              # => "Sparky"
# sparky.name = "Spartacus"
# puts sparky.name              # => "Spartacus"

# our output is the same! The attr_accessor method tkaes
# a symbol as an argument, which it uses to create the method
# name for the getter and setter methods. That one line replaced
# two method definitions.

# But what if we only want the getter method without the 
# setter method? Then we would want to use the attr_reader
# method. It works the same way but only allows you to 
# retrieve the instance variable. And if you only want the
# setter method, you can use the attr_writer method. All of the
# attr_* methods take a Symbol as parameters; if there are more
# states you're tracking, you can use this syntax:

# attr_accessor :name, :height, :weight

# Accessor Methods in Action

# With getter and setter methods, we have a way to expose
# and change an object's state. We can also use these
# methods from within the calss as well. In the previous 
# section, the speak method referenced the @name instance
# variable, like below:

# def speak
#   "#{@name} says arf!"
# end

# Instead of referencing the instance variable directly, we
# want to use the name getter method that we created earlier,
# and that is given to us now by attr_accessor. We'll change
# the speak method to this:

# def speak
#   "#{name} says arf!"
# end

# Can you spot the change? By removing the @ symbol, we're 
# now calling the instance method, rather than the instance
# variable.

# Why do this? Why not just reference the @name instance 
# variable, like we did before? Technically, you could
# just reference the instance variable, but it's generally
# a good idea to call the getter method instead.

# Suppose we are keepting track of social security numbers 
# in an instance variable called @ssn. And suppose that we
# don't want to expose the raw data, i.e. the entire
# social security number, in our applicatoin. Whenever
# we retrieve it, we want to only display the last 4
# didgits and mask the rest, like this: "xxx-xx-1234".
# If we were referencing the @ssn instance variable 
# directly, we'd need to sprinkle our entier class with code
# like this:

# converts '123-45-6789' to 'xxx-xx-6789'

# 'xxx-xx-' + @ssn.split('-').last

# And what if we find a bug in this code, or if someone says
# we need to change the format to something else? It's much
# easier to just reference a getter method, and make the 
# change in one place.

# def ssn
#   # converts '123-45-6789' to 'xxx-xx-6789'
#   'xx-xx-' + @ssn.split('-').last
# end

# Now we can use the ssn instance method (note without the @)
# throughout our class to retrieve the social security number.
# Following this practice will save you some headache down the 
# line. Just like the getter method, we also want to do the
# same with the setter method. Wherever we're changing the
# instance variable direcly in our class, we should instead
# use the setter method. But there's a gotcha, which we'll 
# cover next.

# Suppose we added two more states to track the GoodDog class
# called "height" and "weight":

# attr_accessor :name, :height, :weight

# This one line of code gives us size getter/setter instance
# methods: name, name=, height, height=, weight, weight=.
# It also gives us three instance variables: @name, @height,
# @weight. Now suppose we want to create a new method that
# allos us to change several states at once, called 
# change_info(n, h, w). The three arguments to the method
# correspond to the new name, height, and weight, respectively.
# We could implement it like this:


# def change_info(n, h, w)
#   @name = n
#   @height = h
#   @weight = w 
# end

# Just to get caught up with all of our code, our entire
# GoodDog class now looks like the code below. Note the change
# to the initialize method and also the new method change_info.
# Finally, we created another method called info that displays
# all the states of the object, just for convenience:

# good_dog.rb

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
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
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end


# # And we can use the change_info method like this:

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info    # => Sparky weighs 10 lbs and is 12 inches tall.

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info    # => Spartacus weighs 45 lbs and is 24 inches tall.


# Just like when we replaced accessing the instance variable
# directly with getter methods, we'd also like to do the same
# with our setter methods. Let's change the implementation
# of the change_info method to this:

# def change_info(n, h, w)
#   name = n
#   height = h
#   weight = w
# end

# To save space, we won't repeat the code from above, but we 
# can see that the change_info method didn't change
# sparky's information:

# sparky.change_info('Spaartacus', '24 inches', '45 lbs')
# puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

# What happened? Why didn't our setter methods work in the
# change_info method?

# Calling Methods With self

# The reason our setter methods didn't work is because Ruby
# thought we were initializing local variables. Recall that
# to initialize or create new local variables, all we have to do
# is x = 1 or str = "hello world". It turns out that instead
# of calling the name=, height=, and weight= setter methods
# what we did was create three new local variables called 
# name, height, and weight. That's definitley not what we
# wanted to do.

# To disambiguate from creating a local variable, we need
# to use self.name= to let Ruby know that we're calling
# a method. So our change_info code should be updated to this:

# def change_info(n, h, w)
#   self.name = n
#   self.height = h
#   self.weight = w
# end

# This tells Ruby that we're calling a setter method, not
# creating a local variable. To be consistent, we could 
# also adopt this syntax for the getter methods as well, 
# though it is not required.

# def info
#   "#{self.name} weights #{self.weight} and is #{self.height} tall."
# end

# Finally if we run our code with the updated change_info
# method that uses the self. syntax, our code works beautifully:

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info    # Spartacus weighs 45 lbs and is 24 inches tall.

# Note that prefixing self. is not restrited to just the accessor
# methods; you can use it with any instance method. For example, the 
# info method is not a method given to us by attr_accessor, 
# but we can still call it using self.info:

# good_dog.rb

# class GoodDog
#   # ... rest of code omitted for brevity
#   def some_method
#     self.info
#   end
# end


# Exercises

# 1. Create a class called MyCar. When you  
# initialize a new instance or object of the class, 
# allow the user to define some instance variables that 
# tell us the year, color, and model of the car. Create an 
# instance variable that is set to 0 during instantiation of 
# the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up,
#  brake, and shut the car off.

# class MyCar
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(n)
#     @name = n
#   end

#   def honk
#     "#{@name} says honk!"
#   end
# end


# hondaCRV = MyCar.new("Honda CRV")
# puts hondaCRV.honk
# puts hondaCRV.name
# hondaCRV.name = "Gina"
# puts hondaCRV.name





# class MyCar
#   attr_accessor :name, :make, :year, :color, :model, :speed

#   def initialize(name, make, year, color, model, speed)
#     @name = name
#     @make = make
#     @year = year
#     @color = color
#     @model = model
#     @speed = speed
#   end

#   def honk
#     "#{name} says honk!"
#   end

#   def change_info(name, make, year, color, model, speed)
#     self.name = name
#     self.make = make
#     self.year = year
#     self.color = color
#     self.model = model
#     self.speed = speed
#   end

#   def info
#     "#{self.name} is a #{self.color} #{self.year} #{self.make} #{self.model}."
#   end

#   def speed_up
#     @speed += 10
#   end

#   def brake
#     @speed -= 10
#   end

#   def turn_off
#     @speed = 0
#   end
# end


# car = MyCar.new("Rosa", "Honda", 2012, "grey", "CRV", 0 )
# puts car.honk
# puts car.name
# car.name = "Gina"
# puts car.name
# puts car.info
# car.change_info('Helen', "Buick", 2004, "gold", "Regal", 0)
# puts car.info
# puts car.speed_up


# Book Answer

class MyCar
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)

  end

end





















