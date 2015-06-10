require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
end

#station = DockingStation.new
#bike = station.release_bike
#bike.working?
