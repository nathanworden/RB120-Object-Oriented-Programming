class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
p Cat.ancestors

# Cat
# Animal

# Then it stops because it finds #color in #Animal. It does not 
#continue to check the following:
# Object
# Kernal
# Basic_Object