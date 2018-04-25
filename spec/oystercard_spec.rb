require './lib/oystercard.rb'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let (:entry_station) { double :station }
  let (:exit_station) { double :station }



  describe '#initialize' do
    it 'should have a default balance equal to DEFAULT_BALANCE' do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end
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
    it 'should deduct from the balance' do
      expect { oystercard.touch_out(exit_station) }. to change{ oystercard.balance }.by(-Oystercard::FARE)
    end
  end

end
