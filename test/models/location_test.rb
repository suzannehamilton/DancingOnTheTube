require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should save valid location" do
    location = Location.new
    location.name = "New location"
    assert location.save, "Did not save new location"
  end

  test "location without a name is invalid" do
    location = Location.new
    refute location.save, "Saved a location without a name"
  end
end
