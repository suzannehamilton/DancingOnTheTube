require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "new should be a valid page" do
    get :new, organisation_id: organisations(:salsa_org)
    assert_response :success
  end

  test "create should create a new event" do
    assert_difference('Event.count') do
      post :create,
        organisation_id: organisations(:salsa_org),
        event: {name: 'Test name', start_date: '2014-01-01'}
    end
  end

  test "invalid create should re-render creation form" do
    post :create, organisation_id: organisations(:salsa_org), event: {name: nil}
    assert_response :success
    assert_template :new
  end

  test "create should redirect to related organisation index" do
    post :create,
      organisation_id: organisations(:salsa_org),
      event: {name: 'Test name', start_date: '2014-01-01'}
    assert_redirected_to :controller => "organisations",
      :action => "index",
      :notice => ("New event created for organisation: " + organisations(:salsa_org).name)
  end
end
