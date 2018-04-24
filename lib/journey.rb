class Journey

  attr_reader :current_journey, :journey_history

  def initialize
    @current_journey = {entry_station: nil, exit_station: nil}
    @journey_history = []
  end

end
