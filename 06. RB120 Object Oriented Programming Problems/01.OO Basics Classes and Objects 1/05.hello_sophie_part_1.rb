class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')

# Instance variables are variables that exis only within an
# object instance. They are available to reference only once
# the object has been initialized. They're differentiated
# by the @ symbol prepended to their name, like this: @name.