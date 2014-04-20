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

  test "edit should get location for editing" do
    get :edit, id: locations(:town_hall)

    assert_response :success
    assert_equal locations(:town_hall), assigns(:location)
  end

  test "updating a valid location should save the location" do
    post :update, id: locations(:town_hall), location: {name: "New name", latitude: 50, longitude: -50}

    updated_location = Location.find(locations(:town_hall).id)
    assert_equal "New name", updated_location.name
    assert_equal 50, updated_location.latitude
    assert_equal -50, updated_location.longitude
  end

  test "update valid location should redirect to location index" do
    post :update, id: locations(:town_hall), location: {name: "New name"}
    Location.find(locations(:town_hall).id)
    assert_redirected_to :controller => "locations", :action => "index", :notice => "Location updated"
  end

  test "invalid update should re-render edit form" do
    post :update, id: locations(:town_hall), location: {name: ""}
    assert_response :success
    assert_template :edit
  end

  test "deletion redirects to index page" do
    post :destroy, id: locations(:town_hall)

    assert_redirected_to :controller => "locations", :action => "index", :notice => "Location deleted"
  end

  test "can delete a location" do
    assert_difference('Location.count', -1) do
      post :destroy, id: locations(:town_hall)
    end

    assert_not Location.exists?(locations(:town_hall).id)
  end
end
