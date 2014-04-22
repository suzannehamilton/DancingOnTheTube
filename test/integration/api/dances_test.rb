require "test_helper"

class DancesTest < ActionDispatch::IntegrationTest
  fixtures :dances

  def test_get_all_dances
    get "api/dances", {}, { "Accept" => "application/json" }
    assert_equal 200, status

    body = JSON.parse(response.body)
    dance_names = body.map { |d| d["name"]}

    assert dance_names.include? "Salsa"
    assert dance_names.include? "West Coast Swing"
  end
end