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

  describe '#start journey' do
    before do
      oystercard.top_up(10)
      oystercard.start_journey
    end
    # it 'should start a journey' do
    #
    # end
  end

  describe '#touch in error' do
    it 'raises an error if the card has insufficient balance to start a journey' do
      expect { oystercard.start_journey }.to raise_error "Insufficient balance"
    end
    # it 'should not initialize a journey' do
    #
    # end
  end

  describe '#end journey' do
    before do
      oystercard.top_up(10)
      oystercard.end_journey
    end
    it 'should deduct the fare from the balance' do
      expect { oystercard.end_journey }. to change{ oystercard.balance }.by(-Oystercard::FARE)
    end
  end

end
