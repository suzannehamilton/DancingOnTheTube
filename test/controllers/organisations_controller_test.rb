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
end