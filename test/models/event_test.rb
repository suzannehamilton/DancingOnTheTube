require 'test_helper'

class EventTest < ActiveSupport::TestCase

  DAYS = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

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

  DAYS.each do |day|
    define_method("test_#{day}_event_recurs_on_#{day}") do
      event = build(:weekly_event, weekday: day)

      assert event.recurs_on_day?(day), "#{day} event denies that it is on #{day}"
    end

    DAYS.select { |d| d != day }.each do |other_day|
      define_method("test_#{day}_event_does_not_recur_on_#{other_day}") do
        event = build(:weekly_event, weekday: day)

        assert !event.recurs_on_day?(other_day), "#{day} event is incorrectly on #{other_day}"
      end
    end

    define_method("test_non_recurring_event_does_not_recur_on_#{day}") do
      event = build(:event)

      assert !event.recurs_on_day?(:monday), "Non-recurring event recurs on #{day}"
    end
  end

  def recurrenceForDate(date)
    create(:weekly_recurrence, day_of_week: date.wday)
  end
end
