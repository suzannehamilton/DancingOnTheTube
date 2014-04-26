require 'securerandom'

FactoryGirl.define do
  factory :organisation do
    # Use a UUID as the name, because organisation names must be unique
    name {SecureRandom.uuid}
    url "http://www.example.com"
  end

  factory :org_with_locations, :parent => :organisation do
    locations {[FactoryGirl.create(:location)]}
  end
end
