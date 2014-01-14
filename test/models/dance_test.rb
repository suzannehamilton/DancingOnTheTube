require 'test_helper'

class DanceTest < ActiveSupport::TestCase
  test "should save valid dance" do
    dance = Dance.new
    dance.name = "Salsa"
    assert dance.save, "Did not save dance"
  end
end
