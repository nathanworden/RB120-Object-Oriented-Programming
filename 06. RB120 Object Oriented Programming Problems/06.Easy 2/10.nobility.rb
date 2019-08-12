module Walkable
  # def walk
  #   "#{self} #{gait} forward"
  # end
end

class Animal

  def initialize(name)
    @name = name
  end

  

  def walk
    "#{self} #{gait} forward"
  end

  def to_s
    name
  end
end

class Person < Animal
  attr_reader :name

  include Walkable

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  attr_reader :name

  include Walkable

  # def to_s
  #   name
  # end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  attr_reader :name

  include Walkable

  # def to_s
  #   name
  # end

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :name, :title

  include Walkable

  def initialize(name, title)
    @title = title
    @name = name
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end



byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

byron.name
# => "Byron"
byron.title
# => "Lord"

flash = Cheetah.new("Flash")
p flash.walk

kitty = Cat.new("Kitty")
p kitty.walk
