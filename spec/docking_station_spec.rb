require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it 'release working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  
end

#station = DockingStation.new
#bike = station.release_bike
#bike.working?
