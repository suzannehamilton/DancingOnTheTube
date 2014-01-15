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
end