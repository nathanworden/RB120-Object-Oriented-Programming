<<<<<<< HEAD
class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
=======
# class SecretFile
#   def initialize(secret_data, logger)
#     @data = secret_data
#     @logger = logger
#   end

#   def data
#   	@logger.create_log_entry
#   	@data
#   end
# end

# class SecurityLogger
# 	attr_accessor :log

# 	def initialize
# 		@log = []
# 	end

#   def create_log_entry
#   	log << Time.new
#   end
# end

# log = SecurityLogger.new
# new_access = SecretFile.new('oooSecrets', log)
# new_access.data
# new_access.data
# new_access.data
# p new_access.data
# p log.log



# Question 2


# module Moveable
# 	attr_accessor :speed, :heading
# 	attr_writer :fuel_capacity, :fuel_efficiency

# 	def range
# 		@fuel_capacity * @fuel_efficiency
# 	end
# end

# class WheeledVehicle
# 	include Moveable

# 	def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
# 		@tires = tire_array
# 		self.fuel_efficiency = km_traveled_per_liter
# 		self.fuel_capacity = liters_of_fuel_capacity
# 	end

# 	def tire_pressure(tire_index)
# 		@tires[tire_index]
# 	end

# 	def inflate_tire(tire_index, pressure)
# 		@tires[tire_index] = pressure
# 	end
# end

# class Auto < WheeledVehicle
# 	def initialize
# 		# 4 tires are various tire pressures
# 		super([30, 30, 32, 32], 50, 25.0)
# 	end
# end

# class Motorcycle < WheeledVehicle
# 	def initialize
# 		# 2 tires are various tire pressures
# 		super([20, 20], 80, 8.0)
# 	end
# end

# class Catamaran
# 	include Moveable
# 	attr_reader :propeller_count, :hull_count

# 	def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
# 		self.fuel_efficiency = km_traveled_per_liter
# 		self.fuel_capacity = liters_of_fuel_capacity
# 		# ... code omitted ...
# 	end
# end

# car = Auto.new
# motorcycle = Motorcycle.new

# puts

# p car
# p motorcycle

# puts

# p "Motorcycle Tire Pressure Before: #{motorcycle.tire_pressure(0)}"
# motorcycle.inflate_tire(0, 100)
# p "Motorcycle Tire Pressure After: #{motorcycle.tire_pressure(0)}"

# puts

# p motorcycle.range



# Question 3


# module Moveable
# 	attr_accessor :speed, :heading
# 	attr_writer :fuel_capacity, :fuel_efficiency

# 	def range
# 		@fuel_capacity * @fuel_efficiency
# 	end
# end

# class WheeledVehicle
# 	include Moveable

# 	def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
# 		@tires = tire_array
# 		self.fuel_efficiency = km_traveled_per_liter
# 		self.fuel_capacity = liters_of_fuel_capacity
# 	end

# 	def tire_pressure(tire_index)
# 		@tires[tire_index]
# 	end

# 	def inflate_tire(tire_index, pressure)
# 		@tires[tire_index] = pressure
# 	end
# end

# class Auto < WheeledVehicle
# 	def initialize
# 		# 4 tires are various tire pressures
# 		super([30, 30, 32, 32], 50, 25.0)
# 	end
# end

# class Motorcycle < WheeledVehicle
# 	def initialize
# 		# 2 tires are various tire pressures
# 		super([20, 20], 80, 8.0)
# 	end
# end

# class Seacraft
# 	include Moveable
# 	attr_reader :propeller_count, :hull_count

# 	def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
# 		@propeller_count = num_propellers
# 		@hull_count = num_hulls
# 		self.fuel_efficiency = fuel_efficiency
# 		self.fuel_capacity = fuel_capacity
# 	end
# end

# class Catamaran < Seacraft
# end

# class Motorboat < Seacraft
# 	def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
# 		super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
# 	end
# end

# water_lily = Catamaran.new(4, 4, 60, 100)

# p water_lily
# p "The water lily's range is #{water_lily.range} miles"


# Question 4

module Moveable
	attr_accessor :speed, :heading
	attr_writer :fuel_capacity, :fuel_efficiency

	def range
		@fuel_capacity * @fuel_efficiency
	end
end

class WheeledVehicle
	include Moveable

	def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
		@tires = tire_array
		self.fuel_efficiency = km_traveled_per_liter
		self.fuel_capacity = liters_of_fuel_capacity
	end

	def tire_pressure(tire_index)
		@tires[tire_index]
	end

	def inflate_tire(tire_index, pressure)
		@tires[tire_index] = pressure
	end
end

class Auto < WheeledVehicle
	def initialize
		# 4 tires are various tire pressures
		super([30, 30, 32, 32], 50, 25.0)
	end
end

class Motorcycle < WheeledVehicle
	def initialize
		# 2 tires are various tire pressures
		super([20, 20], 80, 8.0)
	end
>>>>>>> d2dad9ce1ab4dacf0d103c39d2b9409fe8a247fc
end

class Seacraft
	include Moveable
	attr_reader :propeller_count, :hull_count

	def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
		@propeller_count = num_propellers
		@hull_count = num_hulls
		self.fuel_efficiency = fuel_efficiency
		self.fuel_capacity = fuel_capacity
	end

	def range
		super + 10
	end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft
	def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
		super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
	end
end

water_lily = Catamaran.new(4, 4, 60, 100)

p water_lily
p "The water lily's range is #{water_lily.range} miles"

green_motorcycle = Motorcycle.new
p "The green motorcycle's range is #{green_motorcycle.range} miles"
























