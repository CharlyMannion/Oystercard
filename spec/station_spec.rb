require './lib/station.rb'

describe Station do
  let (:name) { double :name }
  let (:zone) { double :zone }
  subject(:station) { described_class.new(name, zone) }

  describe '#initialize' do
    it 'should have a name' do
      expect(station.name).to eq name
    end
    it 'should have a zone' do
      expect(station.zone).to eq zone
    end
  end
end
