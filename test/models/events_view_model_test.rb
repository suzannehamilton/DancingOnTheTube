require 'test_helper'

# TODO: Rename to EventsViewTest?
class EventsViewModelTest < ActiveSupport::TestCase
  test "classes are events with grouped by weekly recurrence" do

    monday_event_1 = create(:weekly_event, weekday: :monday)
    monday_event_2 = build(:weekly_event, weekday: :monday)
    thursday_event = build(:weekly_event, weekday: :thursday)
    saturday_event = build(:weekly_event, weekday: :saturday)
    non_recurring_event = build(:event)

    events = [thursday_event, non_recurring_event, monday_event_1, saturday_event, monday_event_2]

    events_view = EventsView.new(events)

    classes_by_day = events_view.classes_by_day

    assert_equal 7, classes_by_day.size

    assert_equal 2, classes_by_day[:monday].size
    assert_equal monday_event_1.name, classes_by_day[:monday][0].name
    assert_equal monday_event_2.name, classes_by_day[:monday][1].name

    assert classes_by_day[:tuesday].empty?
    assert classes_by_day[:wednesday].empty?

    assert_equal 1, classes_by_day[:thursday].size
    assert_equal thursday_event.name, classes_by_day[:thursday][0].name

    assert classes_by_day[:friday].empty?

    assert_equal 1, classes_by_day[:saturday].size
    assert_equal saturday_event.name, classes_by_day[:saturday][0].name

    assert classes_by_day[:sunday].empty?
  end
end