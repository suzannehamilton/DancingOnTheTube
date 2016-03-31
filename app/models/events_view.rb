# TODO: Move into view model directory?
class EventsView
  attr_reader :classes

  def initialize(events)
    @classes = events.select { |e| !e.weekly_recurrence.nil? }
  end
end