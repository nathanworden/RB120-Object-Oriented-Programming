class Transform
  attr_reader :data
  
  def initialize(input)
    @data = input
  end

  def self.lowercase(input)
    input.downcase
  end

  def uppercase
    data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')