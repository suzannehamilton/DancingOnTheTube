require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  test "should save valid organisation" do
    organisation = Organisation.new
    organisation.name = "New organisation"
    assert organisation.save, "Did not save organisation"
  end

  test "organisation without name is invalid" do
    organisation = Organisation.new
    refute organisation.save, "Saved a organisation without a name"
  end

  test "organisation with empty is invalid" do
    organisation = Organisation.new
    organisation.name = ""
    refute organisation.save, "Saved a organisation without a name"
  end

  test "organisation with duplicate name is invalid" do
    organisation = Organisation.new
    organisation.name = organisations(:salsa_org).name
    refute organisation.save, "Saved a organisation with duplicate name"
  end

  test "organisation with duplicate differently cased name is invalid" do
    organisation = Organisation.new
    organisation.name = organisations(:salsa_org).name.upcase
    refute organisation.save, "Saved a organisation with duplicate name"
  end
end
