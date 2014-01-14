require 'test_helper'

class DanceTest < ActiveSupport::TestCase
  test "should save valid dance" do
    dance = Dance.new
    dance.name = "Salsa"
    assert dance.save, "Did not save dance"
  end

  test "should not save dance without name" do
    dance = Dance.new
    refute dance.save, "Saved a dance without a name"
  end
end
