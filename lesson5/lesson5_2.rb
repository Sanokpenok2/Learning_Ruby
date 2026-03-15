class Vehicle
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def power_reserve
    raise NotImplementedError
  end
end

class Car < Vehicle
  attr_reader :fuel, :consumption

  def initialize(model, fuel, consumption)
    super(model)
    @fuel = fuel
    @consumption = consumption
  end

  def power_reserve
    return fuel / consumption * 100
  end
end

class ElectricCar < Vehicle
  def initialize(model, amp_hour, volt, consumption)
    super(model)
    @capacity = amp_hour * volt
    @consumption = consumption
  end

  def power_reserve
    @capacity / @consumption * 100
  end
end

class Sedan < Car
  def initialize(model, fuel, consumption, actuator = "front-wheel")
    @actual = actuator
    super(model, fuel, consumption)
  end
end

class OffRoad < Car
  def initialize(model, fuel, consumption, actuator = "all-wheel")
    @actual = actuator
    super(model, fuel, consumption)
  end
end

off_road = OffRoad.new("audi", 120.0, 7.0)
puts off_road.power_reserve