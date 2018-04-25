class Journey

  #STEP: MOVE JOURNEY HISTORY IN TO NEW CLASS

  attr_reader :current_journey, :journey_history

  def initialize
    @current_journey = {entry_station: nil, exit_station: nil, complete: nil}
    @journey_history = []
  end

  def touch_in(entry_station)
    @current_journey[:entry_station] = entry_station
    @current_journey[:complete] = false
  end

  def touch_out(exit_station)
    @current_journey[:exit_station] = exit_station #setting hash of exit_station from nil to exit_station
    @current_journey[:complete] = true
    @journey_history << @current_journey
  end

  def complete?
    @current_journey[:complete] = true
  end

end
