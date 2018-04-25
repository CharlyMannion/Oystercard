require './lib/journey'

describe Journey do

  subject(:journey) { described_class.new }
  let (:entry_station) { double :station }
  let (:exit_station) { double :station }

  describe '#initialize' do
    it 'should have an empty journey as default (entry & exit station are nil)' do
      current_journey = { entry_station: nil, exit_station: nil, complete: nil }
      expect(journey.current_journey).to eq current_journey
    end
    it 'should have an empty journey history' do
      expect(journey.journey_history).to eq []
    end
  end

  describe '#touch_in' do
    it 'should have an entry station and be an incomplete journey' do
      journey.touch_in(entry_station)
      start_journey = { entry_station: entry_station, exit_station: nil, complete: false }
      expect(journey.current_journey).to eq start_journey
    end
  end

  describe '#touch_out' do
    before do
      journey.touch_in(entry_station)
    end
    it 'should save a complete journey' do
      journey.touch_out(exit_station)
      end_journey = { entry_station: entry_station, exit_station: exit_station, complete: true }
      expect(journey.current_journey).to eq end_journey
    end
  end

  describe '#complete?' do
    it 'should return true if the journey is complete' do
      journey.touch_in(entry_station)
      journey.touch_out(exit_station)
      end_journey = { entry_station: entry_station, exit_station: exit_station, complete: true }
      expect(journey.complete?).to eq true
    end
  end

  describe '#journey_history' do
    it 'should save the journey' do
      journey.touch_in(entry_station)
      journey.touch_out(exit_station)
      end_journey = { entry_station: entry_station, exit_station: exit_station, complete: true }
      expect(journey.journey_history).to include end_journey
    end
  end

end
