require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it_behaves_like BikeContainer


  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'release working bikes' do
      bike = double :bike, working?: true
      subject.dock bike
      expect(subject.release_bike).to be bike
    end

    it 'does not release broken bikes' do
      bike = double :bike, working?: false
      subject.dock bike
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end


  describe 'dock' do
  it 'raises an error when full' do
    subject.capacity.times { subject.dock double :bike }
    expect { subject.dock double :bike }.to raise_error 'DockingStation full'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }



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
