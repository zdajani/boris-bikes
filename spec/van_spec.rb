require 'van'

xdescribe Van do

  it { is_expected.to respond_to(:receive_bikes).with(1).argument }


  #describe 'receive_bikes' do
    #it "recieves a bike" expect(subject.receive_bikes).to eq


end
