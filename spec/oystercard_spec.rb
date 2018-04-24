require './lib/oystercard.rb'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let (:entry_station) { double :station }
  let (:exit_station) { double :station }



  describe '#initialize' do
    it 'should have a default balance equal to DEFAULT_BALANCE' do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end
    # it 'should not be in journey as a default' do
    #   expect(oystercard.in_journey?).to eq false
    # end
    # it 'should have an empty journey as default (entry & exit station are nil)' do
    #   journey_init = { entry_station: nil, exit_station: nil }
    #   expect(oystercard.journey).to eq journey_init
    # end
    # it 'should have an empty journey history' do
    #   expect(oystercard.journey_history).to eq []
    # end
  end

  describe '#balance' do
    it 'a should have a balance of 0' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'should allow user to increase balance of the oystercard' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end
    it 'should raise an error if the balance is at max limit' do
      allow(oystercard).to receive(:balance).and_return(70)
      expect { oystercard.top_up(40) }.to raise_error "Invalid top up. This card has a max limit of #{Oystercard::MAX_BALANCE}"
    end
  end

  describe '#touch_in' do

    before do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
    end

    # it 'should set in_journey to true if touched in' do
    #   expect(oystercard.in_journey?).to eq true
    # end
    # it 'records the entry station' do
    #   expect(oystercard.entry_station).to eq entry_station
    # end

  end

  describe '#touch in error' do

    it 'raises an error if the card has insufficient balance to touch in' do
      expect { oystercard.touch_in(entry_station) }.to raise_error "Insufficient balance"
    end

  end

  describe '#touch_out' do

    before do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
    end
    it 'should set in_journey to false' do
      oystercard.touch_out(exit_station)
      expect(oystercard.in_journey?).to eq false
    end
    it 'should deduct from the balance' do
      expect { oystercard.touch_out(exit_station) }. to change{ oystercard.balance }.by(-Oystercard::FARE)
    end
    it 'should delete entry station' do
      oystercard.touch_out(exit_station)
      expect(oystercard.entry_station).to be nil
    end
    it 'should save exit station' do
      oystercard.touch_out(exit_station)
      expect(oystercard.exit_station).to eq exit_station
    end
  end

  describe '#journey_history' do
    it 'should save the journey' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      journey = { entry_station: entry_station, exit_station: exit_station }
      expect(oystercard.journey_history).to include journey
    end
  end

end
