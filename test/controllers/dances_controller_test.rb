require 'test_helper'

class DancesControllerTest < ActionController::TestCase
  test "index should list dances" do
    get :index

    listed_dances = assigns(:dances)

    assert_response :success
    assert listed_dances.include?(dances(:salsa))
    assert_not_nil listed_dances
  end
end
