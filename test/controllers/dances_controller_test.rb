require 'test_helper'

class DancesControllerTest < ActionController::TestCase
  test "index should list dances" do
    get :index

    listed_dances = assigns(:dances)

    assert_response :success
    assert listed_dances.include?(dances(:salsa))
    assert_not_nil listed_dances
  end

  test "edit should get task for editing" do
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
end
