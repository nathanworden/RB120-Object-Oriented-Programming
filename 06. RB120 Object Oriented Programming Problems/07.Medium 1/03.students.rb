class Student
  @@student_population = 0

  def initialize(name = nil, year = nil)
    @name = name
    @year = year
    @@student_population += 1
  end

  def self.population
    @@student_population
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

class StudentOnLeave < Student
  def initialize
    super()
  end
end

bob = StudentOnLeave.new()
p bob