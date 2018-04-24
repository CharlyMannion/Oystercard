require './lib/journey'

describe Journey do

  subject(:journey) { described_class.new }
  describe '#initialize' do

    it 'should have an empty journey as default (entry & exit station are nil)' do
      current_journey = { entry_station: nil, exit_station: nil }
      expect(journey.current_journey).to eq current_journey
    end
    it 'should have an empty journey history' do
      expect(journey.journey_history).to eq []
    end

  end


end
