require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @today = Date.today
  end

  test "should save valid event" do
    event = Event.new
    event.name = "New event"
    event.organisation = organisations(:salsa_org)
    event.location = locations(:town_hall)
    assert event.save, "Did not save event"
  end

  test "event without name is invalid" do
    event = Event.new
    event.organisation = organisations(:salsa_org)
    event.location = locations(:town_hall)
    refute event.save, "Saved a event without a name"
  end

  test "event without organisation is invalid" do
    event = Event.new
    event.name = "New event"
    event.location = locations(:town_hall)
    refute event.save, "Saved a event without a parent organisation"
    assert event.errors.full_messages.include? "Organisation can't be blank"
  end

  test "event is associated with a location" do
    organisation = create(:org_with_locations)
    expected_location = organisation.locations[0]
    event = create(:event, location: expected_location, organisation: organisation)

    location = event.location
    assert_equal expected_location, location
  end

  test "event without a location is invalid" do
    event = Event.new
    event.name = "New event"
    event.organisation = organisations(:salsa_org)
    refute event.save, "Saved an event without a location"
  end

  test "can get today's events" do
    event_today_1 = create(:event_recurring_today)
    event_today_2 = create(:event_recurring_today)
    event_other_day = create(:recurring_event, weekly_recurrence: recurrenceForDate(@today + 1))

    actual_events = Event.today

    assert actual_events.include?(event_today_1), "Did not fetch one of today's events"
    assert actual_events.include?(event_today_2), "Did not fetch one of today's events"
    refute actual_events.include?(event_other_day), "Got an event which is on another day"
  end

  test "recurring event is on a specific day of the week" do
    event = build(:weekly_event, weekday: :tuesday)

    assert event.recurs_on_day?(:tuesday), "Tuesday event denies that it is on Tuesday"
  end

  test "recurring event is not on another day of the week" do
    event = build(:weekly_event, weekday: :tuesday)

    assert !event.recurs_on_day?(:wednesday), "Tuesday event thinks that it is on Wednesday"
  end

  test "non-recurring event does not recur on a specific day of the week" do
    event = build(:event)

    # TODO: Use constant on Date?
    assert !event.recurs_on_day?(:monday)
    assert !event.recurs_on_day?(:tuesday)
    assert !event.recurs_on_day?(:wednesday)
    assert !event.recurs_on_day?(:thursday)
    assert !event.recurs_on_day?(:friday)
    assert !event.recurs_on_day?(:saturday)
    assert !event.recurs_on_day?(:sunday)
  end

  # TODO: Parameterised tests?

  def recurrenceForDate(date)
    create(:weekly_recurrence, day_of_week: date.wday)
  end
end
