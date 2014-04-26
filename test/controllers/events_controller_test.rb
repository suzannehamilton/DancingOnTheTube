require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @event = create(:event)
    @recurring_event = create(:recurring_event)
  end

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
        event: {name: 'Test name', location_id: locations(:town_hall)}
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
      event: {name: event_name, location_id: locations(:town_hall)}
    assert_redirected_to edit_organisation_path(organisations(:salsa_org),
      :notice => "New event created: " + event_name)
  end

  test "can save a new recurring event" do
    assert_difference('Event.count') do
      assert_difference('WeeklyRecurrence.count') do
        post :create,
          organisation_id: organisations(:salsa_org),
          event: {
            name: "Test name",
            location_id: locations(:town_hall),
            weekly_recurrence_attributes: {
              :day_of_week => 2,
              :frequency => 2}}
      end
    end
  end

  test "edit path gets event for editing" do
    get :edit, id: @event, organisation_id: @event.organisation

    assert_response :success
    assert_equal @event, assigns(:event)
  end

  test "updating a valid event saves the event" do
    new_name = "New name"
    post :update,
      id: @event,
      organisation_id: @event.organisation,
      event: {name: new_name}

    updated_event = Event.find(@event)
    assert_equal new_name, updated_event.name
  end

  test "updating a valid event redirects to organisation edit page" do
    event_name = "New name"

    post :update,
      id: @event,
      organisation_id: @event.organisation,
      event: {name: event_name}

    assert_redirected_to edit_organisation_path(@event.organisation,
      :notice => "Event updated: " + event_name)
  end

  test "updating a recurring event saves the recurrence details" do
    post :update,
      id: @recurring_event,
      organisation_id: @recurring_event.organisation,
      event: {
        name: "New name",
        weekly_recurrence_attributes: {
          :day_of_week => 3,
          :frequency => 42,
          :id => @recurring_event.weekly_recurrence}}

    updated_event = Event.find(@recurring_event.id)
    assert_equal 3, updated_event.weekly_recurrence.day_of_week
    assert_equal 42, updated_event.weekly_recurrence.frequency
  end

  test "invalid update re-renders edit form" do
    post :update,
      id: @event,
      organisation_id: organisations(:salsa_org),
      event: {name: ""}
    assert_response :success
    assert_template :edit
  end

  test "delete path deletes an event" do
    event = create(:event)
    assert_difference('Event.count', -1) do
      post :destroy, id: event.id, organisation_id: event.organisation.id
    end

    assert_not Event.exists?(event.id)
  end

  test "deletion redirects to organisation edit page" do
    event_to_be_deleted = create(:event)
    post :destroy, id: event_to_be_deleted, organisation_id: event_to_be_deleted.organisation

    assert_redirected_to edit_organisation_path(event_to_be_deleted.organisation,
      :notice => "Deleted event: " + event_to_be_deleted.name)
  end
end
