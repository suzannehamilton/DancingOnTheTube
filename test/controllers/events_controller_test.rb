require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "new should be a valid page" do
    get :new, organisation_id: organisations(:salsa_org)
    assert_response :success
    assert_not_nil assigns(:event)
  end

  test "new should create a new recurrence to edit" do
    get :new, organisation_id: organisations(:salsa_org)
    assert_not_nil assigns(:weekly_recurrence)
  end

  test "create should create a new event" do
    assert_difference('Event.count') do
      post :create,
        organisation_id: organisations(:salsa_org),
        event: {name: 'Test name'}
    end
  end

  test "invalid create should re-render creation form" do
    post :create, organisation_id: organisations(:salsa_org), event: {name: nil}
    assert_response :success
    assert_template :new
  end

  test "create should redirect to related organisation edit page" do
    event_name = "Test name"

    post :create,
      organisation_id: organisations(:salsa_org),
      event: {name: event_name}
    assert_redirected_to edit_organisation_path(organisations(:salsa_org),
      :notice => "New event created: " + event_name)
  end

  test "can save a new recurring event" do
    skip
    assert_difference('Event.count') do
      assert_difference('WeeklyRecurrence.count') do
        post :create,
          organisation_id: organisations(:salsa_org),
          event: {name: 'Test name', weekly_recurrence: {day_of_week: 2, frequency: 2}}
      end
    end
  end

  test "edit path gets event for editing" do
    get :edit, id: events(:salsa_event), organisation_id: organisations(:salsa_org)

    assert_response :success
    assert_equal events(:salsa_event), assigns(:event)
  end

  test "updating a valid event saves the event" do
    new_name = "New name"
    post :update,
      id: events(:salsa_event),
      organisation_id: organisations(:salsa_org),
      event: {name: new_name}

    updated_event = Event.find(events(:salsa_event).id)
    assert_equal new_name, updated_event.name
  end

  test "updating a valid event redirects to organisation edit page" do
    event_name = "New name"

    post :update,
      id: events(:salsa_event),
      organisation_id: organisations(:salsa_org),
      event: {name: event_name}

    assert_redirected_to edit_organisation_path(organisations(:salsa_org),
      :notice => "Event updated: " + event_name)
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
