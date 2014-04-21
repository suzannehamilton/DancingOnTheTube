require 'test_helper'

class EventTest < ActiveSupport::TestCase
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
    location = events(:salsa_event).location
    assert_equal locations(:bandstand), location
  end

  test "event without a location is invalid" do
    event = Event.new
    event.name = "New event"
    event.organisation = organisations(:salsa_org)
    refute event.save, "Saved an event without a location"
  end

  test "event location must be associated with the event's parent organisation" do
    event = Event.new
    event.name = "New event"
    event.organisation = organisations(:salsa_org)
    event.location = locations(:speakeasy)
    refute event.save, "Saved event with an invalid location"
  end
end
