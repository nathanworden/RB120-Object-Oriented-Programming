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

class Box
  def initialize(w, h)
    @width, @height = w, h
  end

  def getArea
    getWidth() * getHeight
  end

  def getWidth
    @width
  end

  def getHeight
    @height
  end

  private :getWidth, :getHeight

  def printArea
    @area = getWidth() * getHeight
    puts "Big box area is: #@area"
  end

  protected :printArea
end

box = Box.new(10, 20)

a = box.getArea()
puts "Area of the box is: #{a}"

box.printArea()

























