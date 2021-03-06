# irb -r './spec/feature_tests.rb'

require './lib/oystercard.rb'
require './lib/station.rb'
require './lib/journey.rb'

def set_balance
  oystercard = Oystercard.new
  p oystercard
end

def top_up
  oystercard = Oystercard.new
  oystercard.top_up(10)
  p oystercard
end

def touched_in
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  p oystercard
end

def balance_deducted
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  oystercard.touch_out('exit_station')
  p oystercard
end

def save_entry_station
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  p oystercard
end

def forget_entry_station
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  oystercard.touch_out('exit_station')
  p oystercard
end

def save_exit_station
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  oystercard.touch_out('exit_station')
  p oystercard
end

def create_journey
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  oystercard.touch_out('exit_station')
  p oystercard
end

def journey_history
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in('station')
  oystercard.touch_out('exit_station')
  p oystercard
end

def station
  p station = Station.new("Stratford", 3)
end

def journey
  p journey = Journey.new
end

def touch_in
  journey = Journey.new
  journey.touch_in('entry_station')
  p journey
end

def touch_out
  journey = Journey.new
  journey.touch_in('entry_station')
  journey.touch_out('exit_station')
  p journey
end

def journey_complete
  journey = Journey.new
  journey.touch_in('entry_station')
  journey.touch_out('exit_station')
  p journey
end

# set_balance
# top_up
# touched_in
# balance_deducted
# save_entry_station
# forget_entry_station
# save_exit_station
# create_journey
# journey_history
# station
journey
touch_in
touch_out
journey_complete

# irb -r './spec/feature_tests.rb'
