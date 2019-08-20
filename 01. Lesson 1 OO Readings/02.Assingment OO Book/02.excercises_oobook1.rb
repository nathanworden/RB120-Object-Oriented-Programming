class MyCar
  protected
  attr_writer :color

  public
  attr_reader :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
    puts "You speed up #{number} miles per hour"
  end

  def brake(number)
    @speed -= number
    puts "You hit the brakes and slow down #{number} miles per hour"
  end

  def current_speed
    puts "The car is currently going #{@speed} miles per hour"
  end

  def turn_off
    @speed = 0
    puts "Turning car off.."
    puts "The car is off dang it!"
    puts "The car is currently going #{@speed} miles per hour"
  end

  def spray_paint(color)
    puts "Yo, we are spray painting your car #{color}"
    self.color = color
  end

  def to_s
    "year: #{@year}, color: #{@color}, model: #{@model}"
  end
end

mycar = MyCar.new(2004, 'gold', 'buick')

puts mycar

mycar.speed_up(15)
mycar.current_speed
mycar.speed_up(15)
mycar.current_speed
mycar.brake(10)
mycar.current_speed
mycar.turn_off

puts

puts mycar.color
mycar.spray_paint('black')
puts mycar.color
puts mycar.year

