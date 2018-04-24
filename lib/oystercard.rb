class Oystercard

  attr_reader :balance, :entry_station, :exit_station

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  FARE = 1

  def initialize(balance = DEFAULT_BALANCE, entry_station = nil)
    @balance = balance
    @entry_station = entry_station
  end

  def top_up(amount)
    raise "Invalid top up. This card has a max limit of #{MAX_BALANCE}" if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    raise "Insufficient balance" if @balance <= MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct
    @entry_station = nil
    @exit_station = exit_station
  end

private

  def deduct
    @balance -= FARE
  end

end
