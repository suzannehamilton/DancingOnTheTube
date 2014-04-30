FactoryGirl.define do
  factory :event do
    sequence(:name) {|n| "event#{n}" }
    organisation
    location

    factory :recurring_event do
      weekly_recurrence
    end
  end

  factory :weekly_recurrence do
    day_of_week 0
    event
  end
end
