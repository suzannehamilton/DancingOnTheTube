require 'test_helper'

class WeeklyRecurrenceTest < ActiveSupport::TestCase
  def setup
    @event = build(:event)
    @recurrence = build(:weekly_recurrence, event: @event)
  end

  test "a valid recurring event can be saved" do
    recurrence = @recurrence

    assert recurrence.save, "Did not save a valid recurrence"
  end

  test "a recurrence cannot be saved without a day of the week" do
    recurrence = @recurrence
    recurrence.day_of_week = nil

    refute recurrence.save, "Saved an invalid recurrence that was not tied to a day of the week"
  end

  test "a negative day of the week is invalid" do
    recurrence = @recurrence
    recurrence.day_of_week = -1
    recurrence.event = @event

    refute recurrence.save, "Saved an invalid recurrence with a negative day of the week"
  end

  test "a day of the week of 7 or greater is invalid" do
    recurrence = @recurrence
    recurrence.day_of_week = 7

    refute recurrence.save, "Saved an invalid recurrence with an out-of-range day of the week"
  end
end
