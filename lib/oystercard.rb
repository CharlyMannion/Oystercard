class Oystercard

  #NEXT STEP: NEED TO START A JOURNEY AND DEDUCT FARE FROM BALANCE WHEN JOURNEY ENDS

  attr_reader :balance

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "Invalid top up. This card has a max limit of #{MAX_BALANCE}" if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def start_journey
    raise "Insufficient balance" if @balance <= MIN_BALANCE
  end

  def end_journey
    deduct
  end

private

  def deduct
    @balance -= FARE
  end

end
