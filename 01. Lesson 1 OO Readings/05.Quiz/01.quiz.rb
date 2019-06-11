# Question 11
# What will the following code output?

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

# Answer

# Cow inherets #speak from Animal. When daisy calls #speak, it calls
# #sound and passes the return value to puts. SInce an instance of 
# Cow calls #speak, #speak calls Cow#sound. Cow#sounds uses super
# to call Animal#sound, which returns the interpolated string 
# "Daisy says ". Cow#sound then concatenates the return value with
# the string "mooooooooooooo!" and returns the new result, which is
# output by puts.