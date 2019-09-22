require 'airport'

describe Airport do


  let(:airport) { double (:airport) }

  describe '#land_plane' do

    it { is_expected.to respond_to :land_plane }

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    # it 'lands a plane' do
    #   expect(subject.land_plane(Plane.new)).to eq subject.planes
    # end

    # it 'raises an error when stormy - prevents plane landing' do
    #   allow(airport).to receive(:weather_check).and_return("stormy")
    #   plane = Plane.new
    #   expect { subject.land_plane(plane) }.to raise_error 'Landing prevented due to stormy weather'
    # end

    it { is_expected.to respond_to :planes }
    #
    # it 'returns a landed plane' do
    #   plane = Plane.new
    #   subject.land_plane(plane)
    #   expect(subject.planes).to eq subject.planes
    # end

    it 'plane can only land if it is flying' do
     subject.land_plane(Plane.new)
     expect { subject.land_plane(Plane.new) }.to raise_error 'Error'
    end

  end

  describe '#initialization' do

    it 'raises an error when airport hits max capacity' do
      subject.capacity.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane(Plane.new) }.to raise_error 'Airport full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
    end

    it 'has a variable capacity' do
      airport = Airport.new(150)
      150.times { airport.land_plane(Plane.new) }
      expect { airport.land_plane(Plane.new) }.to raise_error 'Airport full'
    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'plane takes off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq 'The plane has taken off'
    end

    it 'plane can only take off if it is grounded' do
      expect { subject.take_off }.to raise_error 'Error'
    end


    # it 'raises an error when stormy - prevents plane taking off' do
    #   allow(airport).to receive(:weather_check).and_return("stormy")
    #   # or allow(airport).to receive(:rand).and_return("stormy") ?
    #   plane = Plane.new
    #   subject.land_plane(plane)
    #   expect { subject.take_off }.to raise_error 'Take off prevented due to stormy weather'
    # end

  end

  # it 'generates random weather' do
  #   airport = Airport.new
  #   allow(airport).to receive(:rand).and_return ("stormy")
  #   expect(airport.weather_check).to eq ("stormy")
  # end

end
