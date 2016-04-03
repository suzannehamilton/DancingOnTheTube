# TODO: Move into view model directory?
class EventsView
  attr_reader :classes, :classes_by_day

  def initialize(events)
    # TODO: Delete @classes
    @classes = events.select { |e| !e.weekly_recurrence.nil? }

    # TODO: Make constant or get from Date
    days = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
    # TODO: Tidy
    @classes_by_day = days.map { |d| [d, events.select { |e| !e.weekly_recurrence.nil? && e.weekly_recurrence.day_of_week == DateTime.parse(d.to_s).wday }]}.to_h
  end
end