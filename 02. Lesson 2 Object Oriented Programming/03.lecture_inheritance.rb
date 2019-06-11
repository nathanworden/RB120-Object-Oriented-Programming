# Lecture: Inheritance

# 1) Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak
# puts teddy.swim

# karl = Bulldog.new
# kar.speak
# puts karl.swim

#2) Let's create a few more methods for our Dog class.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet

  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end


class Cat < Pet
  def speak
    "meow!"
  end
end

kitty = Cat.new
p kitty.run


#3)Draw a class hierarchy diagram of the classes from step #2

#                           Pet 
#                        (run, jump)
#             Dog                          Cat
#      (speak, swim, fetch)               (speak)
#            Bulldog
#           (swim)



#4) What is the method lookup path and how is it important?

# The method lookup path is where Ruby goes to look to call methods
# first it will start in the class it is in
# then a module that was included last
# then any other modules in reverse order
# then a parent class
# then any modules that parent class has
# than any other parents until there are no others

# The method lookup path is important because once Ruby finds a method to 
# call in a path, it stops looking. So the methods first in the path
# will be the ones that actually get used. The ones higher up the path
# are effectivley overwritten


# Book Answer

# The method lookup path is the order in which Ruby will traerse the 
# class hierarchy to look for methods to invoke. For example, say
# you have a Bulldog object called bud and you call:
# bud.swim. Ruby will first look for a method called swim in the Bulldog
# class, then traverse up the chain of super-classes; it will invoke
# the fist method called swim and stop its traversal.

# In our simple class hierarchy it's pretty straight forward.Things
# can quickly get complicated in larger libraries or frameworks.
# To see the method lookup path, we can use the .ancestors class method.

# Bulldog.ancestors
# => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]

# Note that this method returns an array, and that all classes sub-calss
# from Object. Don't worry about Kernel or BasicObject for now.







