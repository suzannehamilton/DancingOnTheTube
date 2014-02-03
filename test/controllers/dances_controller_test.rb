require 'test_helper'

class DancesControllerTest < ActionController::TestCase
  test "index should list dances" do
    get :index

    listed_dances = assigns(:dances)

    assert_response :success
    assert listed_dances.include?(dances(:salsa))
    assert_not_nil listed_dances
  end

  test "edit should get dance for editing" do
    get :edit, id: dances(:salsa)

    assert_response :success
    assert_equal dances(:salsa), assigns(:dance)
  end

  test "new should be a valid page" do
    get :new
    assert_response :success
  end

  test "create should create a new dance" do
    assert_difference('Dance.count') do
      post :create, dance: {name: 'Test name'}
    end
  end

  test "create should redirect to dance index" do
    post :create, dance: {name: 'Test name'}
    assert_redirected_to :controller => "dances", :action => "index", :notice => "New dance created"
  end

  test "invalid create should re-render creation form" do
    post :create, dance: {name: nil}
    assert_response :success
    assert_template :new
  end

  test "update valid dance should save the dance" do
    post :update, id: dances(:salsa), dance: {name: "New name"}

    updated_dance = Dance.find(dances(:salsa).id)
    assert_equal "New name", updated_dance.name
  end

  test "update valid dance should redirect to dance index" do
    post :update, id: dances(:salsa), dance: {name: "New name"}
    Dance.find(dances(:salsa).id)
    assert_redirected_to :controller => "dances", :action => "index", :notice => "Dance updated"
  end

  test "invalid update should re-render creation form" do
    post :update, id: dances(:salsa), dance: {name: ""}
    assert_response :success
    assert_template :edit
  end

  test "deletion redirects to index page" do
    post :destroy, id: dances(:salsa)

    assert_redirected_to :controller => "dances", :action => "index", :notice => "Dance deleted"
  end

  test "can delete a dance" do
    assert_difference('Dance.count', -1) do
      post :destroy, id: dances(:salsa)
    end

    assert_not Dance.exists?(dances(:salsa).id)
  end
end
