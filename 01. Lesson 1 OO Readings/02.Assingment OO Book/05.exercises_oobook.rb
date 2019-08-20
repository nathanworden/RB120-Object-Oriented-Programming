# class Animal
#   attr_accessor :name

#   def initialize(color, name)
#     @name = name
#     @color = color
#   end
# end

# class GoodDog < Animal
#   def initialize(color, name)
#     super
#     @color = color
#   end
# end

# bruno = GoodDog.new("brown", "Daniel")  
# p bruno

module Mammal

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal::some_out_of_place_method(4)
p value