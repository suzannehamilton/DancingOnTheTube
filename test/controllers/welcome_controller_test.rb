require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "index should list regular classes" do
    # TODO: Create events with specific days of week to get ordering right
    event1 = create(:event_recurring_today)
    event2 = create(:event_recurring_yesterday)
    event3 = create(:event_recurring_tomorrow)
    non_recurring_event = create(:event)

    get :index

    assert_response :success

    events = assigns(:events)
    classes = events.classes

    assert_equal 3, classes.length
    assert_equal event1.name, classes[0].name
    assert_equal event2.name, classes[1].name
    assert_equal event3.name, classes[2].name
  end
end
