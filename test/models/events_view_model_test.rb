require 'test_helper'

class EventsViewModelTest < ActiveSupport::TestCase
  test "classes are events with weekly recurrence" do

    # TODO: Create better fixtures for events by day
    event1 = build(:event_recurring_today)
    event2 = build(:event_recurring_yesterday)
    event3 = build(:event_recurring_tomorrow)
    non_recurring_event = create(:event)

    events = [event1, non_recurring_event, event2, event3]

    events_view = EventsView.new(events)

    classes = events_view.classes

    assert_equal 3, classes.size
    assert_equal event1.name, classes[0].name
    assert_equal event2.name, classes[1].name
    assert_equal event3.name, classes[2].name
  end
end