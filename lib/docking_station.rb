require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if working_bikes.empty?
    #bike_to_release = bikes.find {|bike| bike.working?}
    #bikes.delete bike_to_release
    bikes.delete working_bikes.pop
  end

  def dock bike
    add_bike bike
  end

  #def bike_count
    #@bikes.count
  #end

  private


  def working_bikes
    bikes.select {|bike| bike.working?}
  end
end
