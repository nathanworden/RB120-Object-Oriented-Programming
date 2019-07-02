class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! my name is #{name}!"
  end

  def name=(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
kitty.greet

kitty.name = 'Luna'
kitty.greet