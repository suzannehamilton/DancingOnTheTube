FactoryGirl.define do
  factory :organisation do
    sequence(:name) {|n| "org#{n}" }
    url "http://www.example.com"
  end

  factory :org_with_locations, :parent => :organisation do
    locations {[FactoryGirl.create(:location)]}
  end
end
