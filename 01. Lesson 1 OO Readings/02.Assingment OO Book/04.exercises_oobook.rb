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

  def self.gas_milage(miles, gallons)
    puts "#{miles / gallons} miles per gallon of gas"
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


MyCar.gas_milage(351, 13)