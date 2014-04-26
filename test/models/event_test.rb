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
end
