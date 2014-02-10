require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  @@test_name = "new organisation"
  @@test_url = "test url"

  test "should save valid organisation" do
    organisation = Organisation.new
    organisation.name = @@test_name
    organisation.url = @@test_url
    assert organisation.save, "Did not save organisation"
  end

  test "organisation without name is invalid" do
    organisation = Organisation.new
    organisation.url = @@test_url

    refute organisation.save, "Saved a organisation without a name"
  end

  test "organisation with empty name is invalid" do
    organisation = Organisation.new
    organisation.name = ""
    organisation.url = @@test_url

    refute organisation.save, "Saved a organisation without a name"
  end

  test "organisation with duplicate name is invalid" do
    organisation = Organisation.new
    organisation.name = organisations(:salsa_org).name
    organisation.url = @@test_url

    refute organisation.save, "Saved a organisation with duplicate name"
  end

  test "organisation with duplicate differently cased name is invalid" do
    organisation = Organisation.new
    organisation.name = organisations(:salsa_org).name.upcase
    organisation.url = @@test_url

    refute organisation.save, "Saved a organisation with duplicate name"
  end

  test "organisation without url is invalid" do
    organisation = Organisation.new
    organisation.name = @@test_name

    refute organisation.save, "Saved a organisation without a url"
  end

  test "has associated dances" do
    dances = organisations(:salsa_org).dances

    assert dances.include? dances(:salsa)
    assert dances.include? dances(:bachata)
  end

  test "organisations are listed alphabetically by name" do
    assert_equal [organisations(:salsa_org), organisations(:west_coast_swing_org)], Organisation.all
  end
end
