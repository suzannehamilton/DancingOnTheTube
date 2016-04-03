require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "index should list regular classes by day" do
    monday_event_1 = create(:weekly_event, weekday: :monday)
    monday_event_2 = create(:weekly_event, weekday: :monday)
    thursday_event = create(:weekly_event, weekday: :thursday)
    saturday_event = create(:weekly_event, weekday: :saturday)
    non_recurring_event = create(:event)

    get :index

    assert_response :success

    events = assigns(:events)
    classes = events.classes

    assert_equal 4, classes.length
    assert_equal monday_event_1.name, classes[0].name
    assert_equal monday_event_2.name, classes[1].name
    assert_equal thursday_event.name, classes[2].name
    assert_equal saturday_event.name, classes[3].name
  end
end
