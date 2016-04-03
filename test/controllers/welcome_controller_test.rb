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
    classes_by_day = events.classes_by_day
    classes = events.classes

    assert_equal 2, classes_by_day[:monday].length
    assert_equal monday_event_1.name, classes_by_day[:monday][0].name
    assert_equal monday_event_2.name, classes_by_day[:monday][1].name

    assert_equal 1, classes_by_day[:thursday].length
    assert_equal thursday_event.name, classes_by_day[:thursday][0].name

    assert_equal 1, classes_by_day[:saturday].length
    assert_equal saturday_event.name, classes_by_day[:saturday][0].name
  end
end
