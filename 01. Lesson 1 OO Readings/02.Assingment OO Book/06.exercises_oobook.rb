module Haulable
  def haul(thing)
    puts "I can haul this #{thing}"
  end
end

class Vehicle
  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
    @age = Time.new
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  def self.total_number_of_vehicles
   puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  private

  def years_old
    Time.now.year - self.year
  end 

  protected

  attr_writer :color

  public

  attr_reader :color, :year, :model

  def self.gas_milage(gallons, miles)
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
    "is currently going #{@speed} miles per hour"
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


class MyCar < Vehicle
  NUMBER_OF_SEATS = 5

  def current_speed
    "The car #{super}"
  end
end

class MyTruck < Vehicle
  include Haulable

  NUMBER_OF_SEATS = 2
 
  def current_speed
    "The truck #{super}"
  end
end

mycar = MyCar.new(2004, 'gold', 'buick')
mytruck = MyTruck.new(2019, 'white', "Ford Raptor")

# Vehicle.total_number_of_vehicles

# mytruck.haul("Speedboat")


# p MyTruck.ancestors
# p MyCar.ancestors

# mytruck.current_speed

# mycar.speed_up(10)
# mycar.speed_up(50)
# mytruck.speed_up(30)
# p mycar.current_speed
# p mytruck.current_speed


p mycar.age

