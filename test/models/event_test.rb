require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should save valid event" do
    event = Event.new
    event.name = "New event"
    assert event.save, "Did not save event"
  end
end
