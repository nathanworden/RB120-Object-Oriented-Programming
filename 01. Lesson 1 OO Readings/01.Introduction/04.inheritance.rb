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

# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable       # mixing in Swimmable module
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable        # mixing in Swimmable module
# end

#  And now Fish and Dog objects can swim, but objects of other classes won't be able to:

# sparky = Dog.new 
# neemo = Fish.new
# paws = Cat.new

# p sparky.swim
# p neemo.swim
# p paws.swim


# Using modules to group common behaviors allows us to build a more powerful, flexible and DRY design.

# Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling. You can see this convention with our Swimmable module. Likewise, we could name a module that describes "walking" as Walkable. Not all modules are named in this manner, however, it is quite common.


# Inheritance vs Modules

# Now that you know the two primary ways that Ruby implements inheritance, class inheritance and mixing in modules, you may wonder when to use one vs the other. Here are a couple of things to remember when evaluating those two choices.

# You can only subclass from one class. But you can mix in as many modules as you'd like.
# If it's an "is-a" relationship, choose class inheritance. If it's a "has-a" relationship, choose modules. Example: a dog "is an" animal; a dog "has an" ability to swim.
# You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.
# As you get better at OO design, you'll start to develop a feel for when to use class inheritance versus mixing in modules.

# module Walkable
#   def walk
#     "I'm walking"
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# We have three modules and one class. We've mixed in one module into the Animal class. The method lookup path is the path Ruby takes to look for a method. We can see this path with the ancestors class method.

# puts "---Animal method lookup---"
# puts Animal.ancestors

#  The output looks like this:

# ---Animal method lookup---
# Animal
# Walkable
# Object
# Kernel
# BasicObject


# This means that when we call a method of any Animal object, first Ruby looks in the Animal class, then the Walkable module, then the Object class, then the Kernel module, and finally the BasicObject class.


# fido = Animal.new
# p fido.speak

# Ruby found the speak method in the Animal class and looked no further.

# p fido.walk

# Ruby first looked for the walk instance method in Animal, and not finding it there, kept looking in the next place according to our list, which is the Walkable module. It saw a walk method there, executed it, and stopped looking further.

# p fido.swim

# => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>

# Ruby traversed all the classes and modules in the list, and didn't find a swim method, so it threw an error.

# Let's add another class to the code above. This class will inherit from the Animal class and mix in the Swimmable and Climbable modules.

# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors



# There are several interesting things about the above output. First, this tells us that the order in which we include modules is important. Ruby actually looks at the last module we included first. This means that in the rare occurrence that the modules we mix in contain a method with the same name, the last module included will be consulted first. The second interesting thing is that the module included in the superclass made it on to the method lookup path. That means that all GoodDog objects will have access to not only Animal methods, but also methods defined in the Walkable module, as well as all other modules mixed in to any of its superclasses.

# Sometimes when you're working on a large project, it can be confusing where all these methods are coming from. By understanding the method lookup path, we can have a better idea of where and how all available methods are organized.

# More Modules

# We've already seen how modules can be used to mix-in common behavior into classes. Now we'll see two more uses for modules.

# The first use case we'll discuss is using modules for namespacing. In this context, namespacing means organizing similar classes under a module. In other words, we'll use modules to group related classes. Therein lies the first advantage of using modules for namespacing. It becomes easy for us to recognize related classes in our code. The second advantage is it reduces the likelihood of our classes colliding with other similarly named classes in our codebase. Here's how we do it:

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end
# end

# We call classes in a module by appending the class name to the module name with two colons(::)

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak('Arf!')
# kitty.say_name('kitty')


# The second use case for modules we'll look at is using modules as a container for methods, called module methods. This involves using modules to house other methods. This is very useful for methods that seem out of place within your code. Let's use our Mammal module to demonstrate:

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end

#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end

# Defining methods this way within a module means we can call them directly from the module:

# value = Mammal.some_out_of_place_method(4)
# p value

# We can also call such methods by doing:

# value = Mammal::some_out_of_place_method(4)
# p value

# although the former is the preferred way.

# Private, Protected, and Public

# The last thing we want to cover is something that's actually quite simple, but necessary. Right now, all the methods in our GoodDog class are public methods. A public method is a method that is available to anyone who knows either the class name or the object's name. These methods are readily available for the rest of the program to use and comprise the class's interface (that's how other classes and objects will interact with this class and its objects).

# Sometimes you'll have methods that are doing work in the class but don't need to be available to the rest of the program. These methods can be defined as private. How do we define private methods? We use the reserved word private in our program and anything below it is private (unless another reserved word is placed after it to negate it).

# In our GoodDog class we have one operation that takes place that we could move into a private method. When we initialize an object, we calculate the dog's age in Dog years. Let's refactor this logic into a method and make it private so nothing outside of the class can use it.

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age 

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   private
#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# sparky.human_years

# We get the error message:

# NoMethodError: private method `human_years' called for
#   #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>

# We have made the human_years method private by placing it under the private reserved word. So what is it good for if we can't call it? private methods are only accessible from other methods in the class. For example, given the above code, the following would be allowed:

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age 

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end

#   private
#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure

# Note that in this case, we can not use self.human_years, because the human_years method is private. Remember that self.human_years is equivalent to sparky.human_years, which is not allowed for private methods. Therefore, we have to just use human_years. In summary, private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called without self.

# Public and private methods are most common, but in some less common situations, we'll want an in-between approach. We can use the protected keyword to create protected methods. The easiest way to understand protected methods is to follow these two rules:

# from outside the class, protected methods act just like private methods.
# from inside the class, protected methods are accessible just like public methods.

# Let's take a look at some examples:

# class Animal
#   def a_public_method
#     "Will this work? " + self.a_protected_method
#   end

#   protected

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end


# Study the above code, as it's a little complicated. We'll create an Animal object and test it out.

# fido = Animal.new
# p fido.a_public_method        # => Will this work? Yes, I'm protected!

# e above line of code shows us that we can call a protected method from within the class, even with self prepended. What about outside of the class?

# p fido.a_protected_method


# This demonstrates the second rule, that we can't call protected methods from outside of the class. The two rules for protected methods apply within the context of inheritance as well.

# There are some exceptions to this rule, but we won't worry about that yet. If you remember those two rules about protected methods, that should be good enough for the time being.

# Accidental Method Overriding

# It’s important to remember that every class you create inherently subclasses from class Object. The Object class is built into Ruby and comes with many critical methods.

# class Parent
#   def say_hi
#     p "Hi from Parent."
#   end
# end

# p Parent.superclass

# This means that methods defined in the Object class are available in all classes.

# Further, recall that through the magic of inheritance, a subclass can override a superclass’s method.

# class Child < Parent
#   def say_hi
#     p "Hi from Child."
#   end
# end

# child = Child.new
# child.say_hi

# This means that, if you accidentally override a method that was originally defined in the Object class, it can have far-reaching effects on your code. For example, send is an instance method that all classes inherit from Object. If you defined a new send instance method in your class, all objects of your class will call your custom send method, instead of the one in class Object, which is probably the one they mean to call. Object send serves as a way to call a method by passing it a symbol or a string which represents the method you want to call. The next couple of arguments will represent the method's arguments, if any. Let's see how send normally works by making use of our Child class:

# son = Child.new
# son.send :say_hi

# Let's see what happens when we define a send method in our Child class and then try to invoke Object's send method:


# class Parent
#   def say_hi
#     p "Hi from Parent."
#   end
# end

# class Child
#   def say_hi
#     p "Hi from Child."
#   end

#   def send
#     p "send from Child..."
#   end
# end

# lad = Child.new
# lad.send :say_hi


# Normally we would expect the output of this call to be "Hi from Child." but upon running the code we get a completely different result:

# ArgumentError: wrong number of arguments (1 for 0)
# from (pry):12:in `send'


# In our example, we're passing send one argument even though our overridden send method does not take any arguments. Let's take a look at another example by exploring Object's instance_of? method. What this handy method does is to return true if an object is an instance of a given class and false otherwise. Let's see it in action:

# c = Child.new
# p c.instance_of? Child      # => true
# p c.instance_of? Parent     # => false

# Now let's override instance_of? within Child:


# class Parent
#   def say_hi
#     p "Hi from Parent."
#   end
# end

# class Child
#   def say_hi
#     p "Hi from Child."
#   end

#   def instance_of?
#     p "I am a fake instance"
#   end

#   def send
#     p "send from Child..."
#   end
# end

# heir = Child.new
# p heir.instance_of? Child

# Again, we'll see something completely different though our intention was to use Object's instance_of? method:

# ArgumentError: wrong number of arguments (1 for 0)
# from (pry):22:in `instance_of?'

# That said, one Object instance method that's easily overridden without any major side-effect is the to_s method. You'll normally want to do this when you want a different string representation of an object. Overall, it’s important to familiarize yourself with some of the common Object methods and make sure to not accidentally override them as this can have devastating consequences for your application.


# Summary
# We've covered quite a bit of ground now. You should be feeling pretty comfortable with the general syntax and structure of the Ruby language. You've got one more set of exercises to help put this information to good use, then you'll be ready to take the next step in your journey as a Ruby developer.

# All this complex knowledge about OOP is meant to help us build better designed applications. While there are definitely wrong ways to design an application, there is often no right choice when it comes to object oriented design, only different tradeoffs. As you gain more experience in object oriented design, you'll start to develop a taste for how to organize and shape your classes. For now, all this may feel a little daunting, but once you learn how to think in an OO way, it's hard to not think in that manner.

# Finally, make sure to take time to go through the exercises. OOP is a tough concept if this is your first time encountering it. Even if you've programmed in another OO language before, Ruby's implementation may be a little different. It's not enough to read and understand; you must learn by doing. Let's get on to the exercises!

# Exercises
# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

# module Towable
#   def can_tow?(pounds)
#     pounds < 2000 ? true : false
#   end
# end


# class Vehicle
#   @@number_of_vehicles = 0

#   attr_accessor :color
#   attr_reader :year

#   def self.number_of_vehicles
#     puts "This program has created #{@@number_of_vehicles} vehicles"
#   end

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @speed = 0
#     @@number_of_vehicles += 1
#   end

#   def self.gas_milage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def speed_up(number)
#       @speed += number
#       puts "You push the gas and speed up #{number} mph."
#   end
  
#   def brake(number)
#     @speed -= number
#     puts "You push the brake and slow down #{number} mph."
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your new #{color} paint job looks great!"
#   end


#   def current_speed
#     "Your current speed is #{@speed}"
#   end
  
#   def shut_off
#     @speed = 0
#     puts "Let's park this bad boy!"
#   end
# end



# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s
#     "My car is a #{color} #{year} #{@model}!"
#   end
# end

# class MyTruck < Vehicle
#   include Towable
#   NUMBER_OF_DOORS = 2

#   def to_s
#     "My truck is a #{color} #{year} #{@model}!"
#   end
# end

# car = MyCar.new("2010", 'Ford Focus', 'silver')
# truck = MyTruck.new("2010", 'Ford Tundra', 'white')

# puts car
# puts truck

# Vehicle.number_of_vehicles

# p truck.can_tow?(1000)

# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors
# puts Towable.ancestors


# 5) Move all of the methods from the MyCar class that also pertain to the 
# MyTruck class into the Vehicle class. Make sure that all of your previous 
# method calls are working when you are finished.

# module Towable
#   def can_tow?(punds)
#     punds < 2000 ? true : false
#   end
# end

# class Vehicle
#   attr_accessor :color
#   attr_reader :model, :year
#   @@number_of_vehicles = 0

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph"
#   end

#   def shut_down
#     puts "Let's park this bad boy!"
#   end

#   def self.gas_milage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your new #{color} paint job looks great!"
#   end
# end

# class MyTruck < Vehicle
#   include Towable

#   NUMBER_OF_DOORS = 2

#   def to_s
#     "My truck is a #{self.color}, #{self.year}, #{self.modle}!"
#   end

#   def age
#     "Your #{self.model} is #{years_old} years old."
#   end

#   private

#   def years_old
#     Time.now.year - self.year
#   end
# end


# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s
#     "My car is a #{self.color}, #{self.year}, #{self.model}!"
#   end
# end

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# MyCar.gas_milage(13, 351)
# lumina.spray_paint("red")
# puts lumina
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors


#7) Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

# class Student
#   attr_accessor :name

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   protected

#   def grade
#     @grade
#   end
# end



# joe = Student.new("Joe", 90)
# bob = Student.new("Bob", 86)

# puts "Well done!" if joe.better_grade_than?(bob)


# Given the following code...

# bob = Person.new
# bob.hi
# And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# What is the problem and how would you go about fixing it?


# My answer
# The 'hi' method is a private method in the Person class.
# You can move 'hi' out of the protected area
























