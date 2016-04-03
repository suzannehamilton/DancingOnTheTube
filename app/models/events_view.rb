# TODO: Move into view model directory?
class EventsView
  attr_reader :classes, :classes_by_day

  DAYS = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  def initialize(events)
    @classes_by_day = DAYS.map { |d|
      [d, events.select { |e| e.recurs_on_day?(d) }]
    }.to_h
  end
end