require './lib/journey'

describe Journey do

  subject(:journey) { described_class.new }
  let (:entry_station) { double :station }
  let (:exit_station) { double :station }

  describe '#initialize' do

    it 'should have an empty journey as default (entry & exit station are nil)' do
      current_journey = { entry_station: nil, exit_station: nil }
      expect(journey.current_journey).to eq current_journey
    end
    it 'should have an empty journey history' do
      expect(journey.journey_history).to eq []
    end

  end

  describe '#touch_in' do

  #  it 'should set in_journey to true if touched in' do
  #    expect(oystercard.in_journey?).to eq true
  #  end
    it 'records the entry station' do
      journey.touch_in(entry_station)
      start_journey = { entry_station: entry_station, exit_station: nil }
      expect(journey.current_journey).to eq start_journey
    end

  end

  describe '#touch_out' do

    before do
      journey.touch_in(entry_station)
    end
    # it 'should set in_journey to false' do
    #   oystercard.touch_out(exit_station)
    #   expect(oystercard.in_journey?).to eq false
    # end
    # it 'should delete entry and exit station' do
    #   journey.touch_out(exit_station)
    #   end_journey = { entry_station: nil, exit_station: nil }
    #   expect(journey.current_journey).to eq end_journey
    # end
    it 'should save journey' do
      journey.touch_out(exit_station)
      end_journey = { entry_station: entry_station, exit_station: exit_station }
      expect(journey.current_journey).to eq end_journey
    end
  end


end
