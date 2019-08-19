class MyCar

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
    puts "The car is currently going #{@speed} miles per hour"
  end

  def brake
    @speed -= 10
    puts "The car is currently going #{@speed} miles per hour"
  end

  def turn_off
    @speed = 0
    puts "Turning car off.."
    sleep(1)
    puts "..."
    sleep(1)
    puts "The car is off dang it!"
    puts "The car is currently going #{@speed} miles per hour"
  end

  def to_s
    "year: #{@year}, color: #{@color}, model: #{@model}"
  end
end

mycar = MyCar.new(2004, 'gold', 'buick')

puts mycar

mycar.speed_up(15)
mycar.speed_up(15)
mycar.brake
mycar.turn_off