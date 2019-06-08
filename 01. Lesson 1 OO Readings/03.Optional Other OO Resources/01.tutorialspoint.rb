# class Box
#   def initialize(width, height)
#     @width, @height = width, height
#   end

#   def printWidth
#     @width
#   end

#   def printHeight
#     @height
#   end

# end

# box = Box.new(10, 20)

# x = box.printWidth()
# y = box.printHeight()

# puts "Width of box is : #{x}"
# puts "Height of box is : #{y}"


# class Box
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def getWidth
#     @width
#   end

#   def getHeight
#     @height
#   end

#   def setWidth=(value)
#     @width = value
#   end

#   def setHeight=(value)
#     @height = value
#   end
# end

# box = Box.new(10, 20)
# box.setWidth = 30
# box.setHeight = 50

# x = box.getWidth()
# y = box.getHeight()

# puts "Width of the box is: #{x}"
# puts "Height of the box is: #{y}"



# ___________________________________________________________________

# Instance Methods

# class Box
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def getArea 
#     @width * @height
#   end
# end

# box = Box.new(10, 20)

# a = box.getArea()
# puts "Area of the box is: #{a}"



# ___________________________________________________________________

# Class Methods and Variables

# class Box
#   @@count = 0

#   def initialize(w, h)
#     @width, @height = w, h
#     @@count += 1
#   end

#   def self.printCount()
#     puts "Box count is: #@@count"
#   end
# end

# box1 = Box.new(10, 20)
# box2 = Box.new(30, 100)

# Box.printCount()


# ___________________________________________________________________

# The to_s Method

# class Box
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def to_s
#     "(w:#@width,h:#@height)" 
#   end
# end

# box = Box.new(10, 20)

# puts "String representation of box is: #{box}"


# ___________________________________________________________________

# Access Control

# class Box
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def getArea
#     getWidth() * getHeight
#   end

#   def getWidth
#     @width
#   end

#   def getHeight
#     @height
#   end

#   private :getWidth, :getHeight

#   def printArea
#     @area = getWidth() * getHeight
#     puts "Big box area is: #@area"
#   end

#   protected :printArea
# end

# box = Box.new(10, 20)

# a = box.getArea()
# puts "Area of the box is: #{a}"

# box.printArea()

# ___________________________________________________________________

# Class Inheritance

# class Box
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def getArea
#     @width * @height
#   end
# end

# class BigBox < Box
#   def printArea
#     @area = @width * @height
#     puts "Big box area is: #@area"
#   end
# end

# box = BigBox.new(10, 20)

# box.printArea()


# ___________________________________________________________________

# Methods Overriding

# class Box
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def getArea
#     @width * @height
#   end
# end

# class BigBox < Box
#   def getArea
#     @area = @width * @height
#     puts "Big box area is: #@area"
#   end
# end

# box = BigBox.new(10, 20)

# box.getArea()


# ___________________________________________________________________

# Operator Overloading

# class Box
# attr_accessor :width, :height

#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def +(other)
#     Box.new(@width + other.width, @height + other.height)
#   end

#   def -@
#     Box.new(-@width, -@height)
#   end

#   def *(scalar)
#     Box.new(@width * scalar, @height * scalar)
#   end

#   def to_s
#     "w: #@width, h: #@height"
#   end
# end

# box1 = Box.new(10, 20)
# box2 = Box.new(20, 30)

# box3 = box1 +(box2)

# puts box3


# ___________________________________________________________________

# Class Constants

# class Box
#   BOX_COMPANY = "TATA Inc"
#   BOXWEIGHT = 10
#   def initialize(w, h)
#     @width, @height = w, h
#   end

#   def getArea
#     @width * @height
#   end
# end

# box = Box.new(10, 20)

# a = box.getArea
# puts "Area of the box is: #{a}"

# puts Box::BOX_COMPANY
# puts "Box weight is #{Box::BOXWEIGHT}"

# ___________________________________________________________________

# Class Information

# class Box
#   puts "Name of self = #{self.name}"
#   puts "Type of self = #{self.type}"
# end

























































