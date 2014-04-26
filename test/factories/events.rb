FactoryGirl.define do
  factory :event do
    name "Lindy event"
    organisation
    location

    factory :recurring_event do
      weekly_recurrence
    end
  end

  factory :weekly_recurrence do
    day_of_week 0
    frequency 1
    event
  end
end
