class GoodDog
  @@number_of_dogs = 0
  DOG_YEARS = 7
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def self.this_is_a_calss_method

  end

  def what_is_self
    self
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def age
    "#{name}'s age is #{@age}"
  end

  def self.total_number_of_dogs
    "Total number of dogs: #{@@number_of_dogs}"
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def engineer_quote
    puts "corn hub"
    "#{@@number_of_dogs}"
  end

  def to_s
    "This dog's name is #{name} and it is #{@age} in dog years."
  end
end

sparky = GoodDog.new('Sparky', '12 inces', '10 lbs')
p sparky.what_is_self

# puts GoodDog.total_number_of_dogs

# sparky = GoodDog.new("Sparky", 4)
# dog2 = GoodDog.new("Fido", 8)

# puts GoodDog.total_number_of_dogs
# puts sparky.age

# puts sparky

# p sparky

# p "#{sparky}"





