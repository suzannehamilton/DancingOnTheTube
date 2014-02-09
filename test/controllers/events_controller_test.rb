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

  test "edit path gets event for editing" do
    get :edit, id: events(:salsa_event), organisation_id: organisations(:salsa_org)

    assert_response :success
    assert_equal events(:salsa_event), assigns(:event)
  end

  test "updating a valid event saves the event" do
    new_name = "New name"
    new_start_date = "2014-03-09"
    post :update,
      id: events(:salsa_event),
      organisation_id: organisations(:salsa_org),
      event: {name: new_name, start_date: new_start_date}

    updated_event = Event.find(events(:salsa_event).id)
    assert_equal new_name, updated_event.name
    assert_equal Date.parse(new_start_date), updated_event.start_date
  end

  test "invalid update re-renders edit form" do
    post :update,
      id: events(:salsa_event),
      organisation_id: organisations(:salsa_org),
      event: {name: ""}
    assert_response :success
    assert_template :edit
  end

  test "delete path deletes an event" do
    assert_difference('Event.count', -1) do
      post :destroy, id: events(:salsa_event), organisation_id: organisations(:salsa_org)
    end

    assert_not Event.exists?(events(:salsa_event).id)
  end

  test "deletion redirects to organisation edit page" do
    event_to_be_deleted = events(:salsa_event)
    post :destroy, id: event_to_be_deleted, organisation_id: organisations(:salsa_org)

    assert_redirected_to edit_organisation_path(organisations(:salsa_org), :notice => "Deleted event: " + event_to_be_deleted.name)
  end
end
