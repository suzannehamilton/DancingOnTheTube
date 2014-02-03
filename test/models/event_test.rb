require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should save valid event" do
    event = Event.new
    event.name = "New event"
    assert event.save, "Did not save event"
  end

  test "event without name is invalid" do
    event = Event.new
    refute event.save, "Saved a event without a name"
  end
end
