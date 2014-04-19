require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "index should list locations" do
    get :index

    listed_locations = assigns(:locations)

    assert_response :success
    assert listed_locations.include?(locations(:town_hall))
    assert_not_nil listed_locations
  end
end
