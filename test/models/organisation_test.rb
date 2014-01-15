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
end
