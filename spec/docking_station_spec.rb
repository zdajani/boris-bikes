require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "knows when it doesn't have any bikes" do
    expect(subject.has_bikes?).to be false
  end



  describe 'releasig a bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'release working bikes' do
      bike = Bike.new
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end
  end


  describe 'docking a bike' do
    it "can dock a bike" do
      bike = Bike.new
      subject.dock bike
      expect(subject.has_bikes?).to be true
    end
  end



  it "knows that the bike count has increased when adding a bike" do
    bike_count = subject.bike_count
    subject.dock Bike.new
    expect(subject.bike_count).to eq bike_count + 1

    expect{subject.dock Bike.new}.to change{subject.bike_count}.by 1
  end

  # it { is_expected.to respond_to(:dock).with(1).argument }

end

#station = DockingStation.new
#bike = station.release_bike
#bike.working?

#station = DockingStation.new
#station.dock Bike.new
#bike = station.release_bike
#bike.working?