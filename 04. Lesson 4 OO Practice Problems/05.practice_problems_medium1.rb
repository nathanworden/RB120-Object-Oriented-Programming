# Question 2

# Question 2
# Alan created the following code to keep track of items for a shopping cart application he's writing:

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     quantity = updated_count if updated_count >= 0
#   end
# end
# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# My answer
# In update_quantity the quantity that is being updated is a local varible.
# it needs to be a instance variable. It should be @quantity.



# Question 3
# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     quantity = updated_count if updated_count >= 0
#   end
# end
# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?


# Yes. Before there wasn't a setter method. Now there is. Now you are allowing
# clients of the class to change the quanitity directly (calling the
# accessor with the instance.quantity = <new value>) rather than by going through 
# the update_quantity method. 

# Someone could update the quantity even if the update count was less than 0.


# class Greeting
#   def greet(string)
#     puts string
#   end
# end


# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# person = Hello.new

# person.hi


# Question 5


# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     if @filling_type == nil && @glazing == nil
#       "Plain"
#     elsif @filling_type != nil && @glazing == nil
#       "#{@filling_type}"
#     elsif @filling_type == nil
#       "Plain with #{@glazing}"
#     else
#       "#{@filling_type} with #{@glazing}"
#     end
#   end
# end


# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     filling_string = @filling_type ? @filling_type : "Plain"
#     glazing_string = @glazing ? " with #{@glazing}" : ''
#     filling_string + glazing_string
#   end
# end


# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
# puts donut2
# puts donut3
# puts donut4
# puts donut5

# Question 6
# If we have these two methods:

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

# mac = Computer.new
# p mac.create_template

# and

# class Computer
#   attr_accessor :template

#   def create_template
#     self.template = "template 14231"
#   end

#   def show_template
#     self.template
#   end
# end

# mac = Computer.new
# p mac.create_template

# What is the difference in the way the code works?

# In the top example "template 13231" is assinged directly to the instance
# variable

# In the bottom example, the setter method is being called through the 
# self.template call in order to be assigned. Both result in the instance
# variable being updated, but the bottom example goes through an extra step.

# Its also important to let the computer know that you aren't assigning a variable
# called template in the bottom example and instead you are calling the 
# template method on the object.

# For the show_template method the top example is calling the getter method
# created by attr_accessor. The bottom method is calling the getter
# method template on the object. They are essentially the same thing.


# Question 7


# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# change the name of self.light_information to just self.information




















