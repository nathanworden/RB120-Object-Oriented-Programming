# class Cat
#   @@total_cats = 0
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{@name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end
# end

# mitzi = Cat.new('Mitzi')
# p mitzi.jump # => "Mitzi is jumping!"
# p Cat.total_cats # => 1
# p "The cat's name is #{mitzi.name}" # => "The cat's name is Mitzi"

class Cat
  @@total_cats = 0

  def initialize(name)
    @name = name
  end

  def jump
    "#{name} is jumping!"
  end

  def self.total_cats
    @@total_cats
  end
end

mitzi = Cat.new('Mitzi')
mitzi.jump # => "Mitzi is jumping!"
Cat.total_cats # => 1
"The cat's name is #{mitzi}" # => "The cat's name is Mitzi"