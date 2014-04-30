FactoryGirl.define do
  factory :event do
    sequence(:name) {|n| "event#{n}" }
    organisation
    location

    factory :recurring_event do
      weekly_recurrence
    end

    factory :event_recurring_today do
      association :weekly_recurrence, day_of_week: Date.today.wday
    end
  end

  factory :weekly_recurrence do
    day_of_week 0
    event
  end
end
