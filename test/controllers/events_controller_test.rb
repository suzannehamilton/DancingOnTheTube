require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "new should be a valid page" do
    get :new
    assert_response :success
  end

  test "create should create a new event" do
    assert_difference('Event.count') do
      post :create, event: {name: 'Test name', start_date: '2014-01-01'}
    end
  end
end
