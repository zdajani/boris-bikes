require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if working_bikes.empty?
    bike_to_release = @bikes.find {|bike| bike.working?}
    @bikes.delete bike_to_release 

  end

  def dock bike
    fail 'Docking station full' if full?
    @bikes << bike
  end

  #def bike_count
    #@bikes.count
  #end

  private

  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end

  def working_bikes
    bikes.select {|bike| bike.working?}
  end
end
