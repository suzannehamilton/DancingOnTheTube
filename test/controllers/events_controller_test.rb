require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "new should be a valid page" do
    get :new
    assert_response :success
  end
end
