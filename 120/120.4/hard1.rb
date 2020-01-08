# 1)

class SecretFile
  LOG_ENTRY = SecurityLogger.new.create_log_entry

  def initialize(secret_data)
    @data = secret_data
    @access_log = [LOG_ENTRY]
  end

  def data
    @access_log << LOG_ENTRY
    @data
  end

  def data=(input)
    @access_log << LOG_ENTRY
    @data = @data + input
  end
end

class SecurityLogger
  def create_log_entry
    Time.new
  end
end

# 2) 

module Wheelable
    def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include Wheelable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    # 4 tires are various tire pressures
    super(50, 25.0)
  end
end

class Motorcycle < Vehicle
  include Wheelable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    # 2 tires are various tire pressures
    super(80, 8.0)
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# 3) 

class Motorboat < Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = 1
    @hull_count = 1
    super
  end
end

# 4) include this module in Motorboat and Catamaran classes

module Driftable
  def range
    @fuel_capacity * @fuel_efficiency + 10
  end
end

