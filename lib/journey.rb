class Journey

  attr_reader :current_journey, :journey_history

  def initialize
    @current_journey = {entry_station: nil, exit_station: nil}
    @journey_history = []
  end

  def touch_in(entry_station)
    @current_journey[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    @current_journey[:exit_station] = exit_station #setting hash of exit_station from nil to exit_station
    @journey_history << @current_journey
  end

end
