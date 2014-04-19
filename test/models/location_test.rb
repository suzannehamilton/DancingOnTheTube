require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should save valid location" do
    location = Location.new
    location.name = "New location"
    location.latitude = 51.455209
    assert location.save, "Did not save new location"
  end

  test "location without a name is invalid" do
    location = Location.new
    refute location.save, "Saved a location without a name"
  end

  test "location without a latitude is invalid" do
    location = Location.new
    location.name = "New location"
    refute location.save, "Saved a location without a latitude"
  end
end
