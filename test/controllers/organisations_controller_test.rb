require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  test "index should list organisations" do
    get :index

    listed_organisations = assigns(:organisations)

    assert_response :success
    assert listed_organisations.include?(organisations(:salsa_org))
    assert_not_nil listed_organisations
  end

  test "new should be a valid page" do
    get :new
    assert_response :success
  end

  test "can create a new valid organisation" do
    assert_difference('Organisation.count') do
      post :create, organisation: {name: 'Test name', url: 'test url'}
    end
  end

  test "create should redirect to index" do
    post :create, organisation: {name: 'Test name', url: 'test url'}
    assert_redirected_to :controller => "organisations", :action => "index", :notice => "New organisation created"
  end

  test "invalid create should re-render creation form" do
    post :create, organisation: {name: '', url: ''}
    assert_response :success
    assert_template :new
  end

  test "edit should get task for editing" do
    get :edit, id: organisations(:salsa_org)

    assert_response :success
    assert_equal organisations(:salsa_org), assigns(:organisation)
  end

  test "edit page lists associated events" do
    get :edit, id: organisations(:salsa_org)

    actual_events = assigns(:organisation).events
    assert_equal organisations(:salsa_org).events, actual_events
    assert actual_events.include? events(:salsa_event)
  end

  test "update valid organisation should save the organisation" do
    post :update, id: organisations(:salsa_org), organisation: {name: "New name", url: 'new url'}

    updated_organisation = Organisation.find(organisations(:salsa_org).id)
    assert_equal "New name", updated_organisation.name
  end

  test "update valid organisation should redirect to organisation index" do
    post :update, id: organisations(:salsa_org), organisation: {name: "New name", url: 'new url'}
    Organisation.find(organisations(:salsa_org).id)
    assert_redirected_to :controller => "organisations", :action => "index", :notice => "Organisation updated"
  end

  test "can save associated dances" do
    post :update, id: organisations(:salsa_org),
      organisation: {name: "New name", url: 'new url', dance_ids: [dances(:west_coast_swing)]}

    updated_organisation = Organisation.find(organisations(:salsa_org).id)
    assert updated_organisation.dances.include? dances(:west_coast_swing)
  end

  test "can save associated locations" do
    post :update,
      id: organisations(:salsa_org),
      organisation: {name: "New name", url: 'new url', location_ids: [locations(:ballroom)]}

    updated_organisation = Organisation.find(organisations(:salsa_org).id)
    assert updated_organisation.locations.include? locations(:ballroom)
  end

  test "invalid update should re-render edit form" do
    post :update, id: organisations(:salsa_org), organisation: {name: ""}
    assert_response :success
    assert_template :edit
  end

  test "deletion redirects to index page" do
    post :destroy, id: organisations(:salsa_org)

    assert_redirected_to :controller => "organisations", :action => "index", :notice => "Organisation deleted"
  end

  test "can delete an organisation" do
    assert_difference('Organisation.count', -1) do
      post :destroy, id: organisations(:salsa_org)
    end

    assert_not Organisation.exists?(organisations(:salsa_org).id)
  end
end