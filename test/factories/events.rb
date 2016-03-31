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

    factory :event_recurring_tomorrow do
      association :weekly_recurrence, day_of_week: (Date.today.wday + 1) % 7
    end

    factory :event_recurring_yesterday do
      association :weekly_recurrence, day_of_week: (Date.today.wday - 1) % 7
    end
  end

  factory :weekly_recurrence do
    day_of_week 0
  end
end
