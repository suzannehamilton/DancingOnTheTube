require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "index should list locations" do
    get :index

    listed_locations = assigns(:locations)

    assert_response :success
    assert listed_locations.include?(locations(:town_hall))
    assert_not_nil listed_locations
  end

  test "new should be a valid page" do
    get :new
    assert_response :success
  end

  test "create should create a new location" do
    assert_difference('Location.count') do
      post :create, location: {name: 'Test name', longitude: 0.5, latitude: -0.5}
    end
  end

  test "create should redirect to location index" do
    post :create, location: {name: 'Test name', longitude: 0.5, latitude: -0.5}
    assert_redirected_to :controller => "locations", :action => "index", :notice => "New location created"
  end

  test "invalid create should re-render creation form" do
    post :create, location: {name: nil}
    assert_response :success
    assert_template :new
  end
end
