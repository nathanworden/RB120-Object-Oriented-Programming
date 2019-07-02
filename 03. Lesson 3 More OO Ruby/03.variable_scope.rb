# class Person
  # def initialize(name, age, location, salary)
  #   @name = name
  #   @age = age
  #   @location = location
  #   @salary = salary
  # end

#   def get_name
#     @name
#   end
# end

# bob = Person.new('bob', 28, "Corvallis", 39000)
# joe = Person.new('joe', 25, "Richardson", 44000)

# puts bob.inspect
# puts joe.inspect

# p bob.get_name


#################################

# class Person
#   @name = "bob"

#   def get_name
#     @name
#   end
# end

# bob = Person.new
# p bob.get_name

#################################


# class Person
#   @@total_people = 0

#   def self.total_people
#     @@total_people
#   end

#   def initialize
#     @@total_people += 1
#   end

#   def total_people
#     @@total_people
#   end
# end

# Person.total_people
# Person.new
# Person.new
# Person.total_people

# bob = Person.new
# bob.total_people

# joe = Person.new
# joe.total_people

# p Person.total_people


#################################


# class Person
#   TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

#   attr_reader :name

#   def self.titles
#     TITLES.join(', ')
#   end

#   def initialize(n)
#     @name = "#{TITLES.sample} #{n}"
#   end
# end

# Person.titles

# bob = Person.new('bob')
# p bob.name

#################################

# module A
#   module B; end
#   module C
#     module D
#       B == A::B
#     end
#   end
# end




















