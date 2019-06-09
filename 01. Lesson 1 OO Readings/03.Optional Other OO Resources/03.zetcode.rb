# Object-oriented programming in Ruby

# class Person
#   def initialize(name="unknown", age=0)
#     @name = name
#     @age = age
#   end

#   def to_s
#     "Name: #{@name}, Age: #{@age}"
#   end
# end

# p1 = Person.new
# p2 = Person.new("unknown", 17)
# p3 = Person.new("Becky", 19)
# p4 = Person.new("Robert")

# puts p1, p2, p3, p4

# ________________________________________________________________

# Ruby Methods
#  encapsulation hides the implementation details of a class from other objects.

# Methods are functions defined inside the body of a class. They are used to perform operations with the attributes of our objects. Methods are essential in the encapsulation concept of the OOP paradigm. For example, we might have a connect method in our AccessDatabase class. We need not to be informed how exactly the method connects to the database. We only have to know that it is used to connect to a database. This is essential in dividing responsibilities in programming, especially in large applications.

# class Person
#   def initialize name
#     @name = name
#   end

#   def get_name
#     @name
#   end
# end

# per = Person.new("Jane")
# puts per.get_name
# puts per.send :get_name


# class Circle
#   @@PI = 3.1415926535

#   def initialize
#     @radius = 0
#   end

#   def set_radius(radius)
#     @radius = radius
#   end

#   def area
#     @radius * @radius * @@PI
#   end
# end

# c = Circle.new
# c.set_radius(5)
# puts c.area


# class Some
#   def method1
#     puts "public method1 called"
#   end

#   public 

#   def method2
#     puts "public method2 called"
#   end

#   def method3
#     puts "public method3 called"
#     method1
#     self.method1
#   end
# end

# s =  Some.new
# s.method1
# s.method2
# s.method3

# ________________________________________________________________

# # Private Methods

# class Some
#   def initialize
#     method1
#   end

#   private

#   def method1
#     puts "private method1 called"
#   end
# end

# s = Some.new
# s.method1

# ________________________________________________________________

# Protected Methods

# class Some

#   def initialize
#     method1
#     self.method1
#   end

#   protected

#   def method1
#     puts "protected method1 called"
#   end
# end

# s = Some.new
# s.method1

# ________________________________________________________________


# Ruby inheritance

# class Being
#   def initialize
#     puts "Being class created"
#   end
# end

# class Human < Being
#   def initialize
#     super
#     puts "Human class created"
#   end
# end

# Being.new
# Human.new

# ________________________________________________________________


# class Being
# end

# class Living < Being
# end

# class Mammal < Living
# end

# class Human < Mammal
# end

# p Human.ancestors

# ________________________________________________________________

# class Being
#   @@count = 0

#   def initialize
#     @@count+=1
#     puts "Being class created"
#   end

#   def show_count
#     "There are #{@@count} beings"
#   end
# end

# class Human < Being
#   def initialize
#     super
#     puts "Human is created"
#   end
# end

# class Animal < Being
#   def initialize 
#     super
#     puts "Animal is created"
#   end
# end

# class Dog < Animal
#   def initialize
#     super
#     puts "Dog is created"
#   end
# end

# Human.new
# d = Dog.new
# puts d.show_count

# ________________________________________________________________

# class Base
#   def initialize
#     @name = "Base"
#   end

#   private

#   def private_method
#     puts "private method called"
#   end

#   protected

#   def protected_method
#     puts "protected method called"
#   end

#   public

#   def get_name
#     return @name
#   end
# end

# class Derived < Base
#   def public_method
#     private_method
#     protected_method
#   end
# end

# d = Derived.new
# d.public_method
# puts d.get_name


# ________________________________________________________________

# Ruby Super Method

class Base

  def show x=0, y=0
    p "Base class, x: #{x}, y: #{y}"
  end
end

class Derived < Base
  def show(x, y)
    super
    super(x)
    super(x, y)
    super()
  end
end

d = Derived.new
d.show(3, 3)



# B ase class, x: 0, y: 0"
# B ase class, x: 3, y: 0"
# B ase class, x: 3, y: 3"
# B ase class, x: 0, y: 0"


































