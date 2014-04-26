require 'test_helper'

class EventViewModelTest < ActiveSupport::TestCase
  test "can be created from an event" do
    event = Event.new
    view_model = EventView.new(event)

    assert_equal event.name, view_model.name
  end
end