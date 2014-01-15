require 'test_helper'

class DanceTest < ActiveSupport::TestCase
  test "should save valid dance" do
    dance = Dance.new
    dance.name = "New dance"
    assert dance.save, "Did not save dance"
  end

  test "dance without name is invalid" do
    dance = Dance.new
    refute dance.save, "Saved a dance without a name"
  end

  test "dance with duplicate name is invalid" do
    dance = Dance.new
    dance.name = dances(:salsa).name
    refute dance.save, "Saved a dance with duplicate name"
  end

  test "dance with differently cased duplicate name is invalid" do
    dance = Dance.new
    dance.name = dances(:salsa).name.upcase
    refute dance.save, "Saved a dance with duplicate name"
  end
end
