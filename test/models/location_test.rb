require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should save valid location" do
    location = LocationBuilder.new
      .withName
      .withLatitude
      .withLongitude
      .build
    assert location.save, "Did not save new location"
  end

  test "location without a name is invalid" do
    location = LocationBuilder.new
      .withLatitude
      .withLongitude
      .build
    refute location.save, "Saved a location without a name"
  end

  test "location without a latitude is invalid" do
    location = LocationBuilder.new
      .withName
      .withLongitude
      .build
    refute location.save, "Saved a location without a latitude"
  end

  test "location without a longitude is invalid" do
    location = LocationBuilder.new
      .withName
      .withLatitude
      .build
    refute location.save, "Saved a location without a latitude"
  end
end

class LocationBuilder
  def initialize
    @location = Location.new
  end

  def withName
    @location.name = "Some name"
    self
  end

  def withLatitude
    @location.latitude = 51.455209
    self
  end

  def withLongitude
    @location.longitude = -0.037112
    self
  end

  def build
    @location
  end
end
