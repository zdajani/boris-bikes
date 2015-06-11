require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  xit "knows when it doesn't have any bikes" do
    expect(subject.empty?).to be true
  end


  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'release working bikes' do
      subject.dock Bike.new
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end


  describe 'dock' do
  it 'raises an error when full' do
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  xdescribe 'docking a bike' do
    it "docks a bike" do
      bike = Bike.new
      subject.dock bike
      expect(subject.empty?).to be
    end
  end


  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can be given a new capacity' do
    #DockingStation capacity = 50
    subject.capacity = 50
    expect(subject.capacity).to eq 50
  end


end



#it "knows that the bike count has increased when adding a bike" do
#expect{subject.dock Bike.new}.to change{subject.bike_count}.by 1

#station = DockingStation.new
#bike = station.release_bike
#bike.working?

#station = DockingStation.new
#station.dock Bike.new
#bike = station.release_bike
#bike.working?
