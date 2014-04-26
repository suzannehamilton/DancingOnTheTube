FactoryGirl.define do
  factory :location do
    sequence(:name) {|n| "location#{n}" }
    longitude 51.5601937
    latitude -0.1662806
  end
end
