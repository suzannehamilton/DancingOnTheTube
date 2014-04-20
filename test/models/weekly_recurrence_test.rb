require 'test_helper'

class WeeklyRecurrenceTest < ActiveSupport::TestCase
  test "a valid event can be saved" do
    weekly_recurrence = WeeklyRecurrence.new
    weekly_recurrence.day_of_week = 0
    weekly_recurrence.frequency = 1
    weekly_recurrence.event = events(:salsa_event)

    assert weekly_recurrence.save, "Did not save a valid recurrence"
  end
end
