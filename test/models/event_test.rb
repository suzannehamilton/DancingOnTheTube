require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should save valid event" do
    event = Event.new
    event.name = "New event"
    event.start_date = Date.parse('2014-01-01')
    assert event.save, "Did not save event"
  end

  test "event without name is invalid" do
    event = Event.new
    event.start_date = Date.parse('2014-01-01')
    refute event.save, "Saved a event without a name"
  end

  test "event without date is invalid" do
    event = Event.new
    event.name = "New event"
    refute event.save, "Saved a event without a start date"
  end
end
