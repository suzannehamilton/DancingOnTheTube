require 'test_helper'

class WeeklyRecurrenceTest < ActiveSupport::TestCase
  test "a valid event can be saved" do
    recurrence = WeeklyRecurrence.new
    recurrence.day_of_week = 0
    recurrence.frequency = 1
    recurrence.event = events(:salsa_event)

    assert recurrence.save, "Did not save a valid recurrence"
  end

  test "a recurrence cannot be saved without an event" do
    recurrence = WeeklyRecurrence.new
    recurrence.day_of_week = 0
    recurrence.frequency = 1

    refute recurrence.save, "Saved an invalid recurrence that was not connected to an event"
  end

  test "a recurrence cannot be saved without a day of the week" do
    recurrence = WeeklyRecurrence.new
    recurrence.frequency = 1
    recurrence.event = events(:salsa_event)

    refute recurrence.save, "Saved an invalid recurrence that was not tied to a day of the week"
  end

  test "a negative day of the week is invalid" do
    recurrence = WeeklyRecurrence.new
    recurrence.frequency = 1
    recurrence.day_of_week = -1
    recurrence.event = events(:salsa_event)

    refute recurrence.save, "Saved an invalid recurrence with a negative day of the week"
  end

  test "a day of the week of 7 or greater is invalid" do
    recurrence = WeeklyRecurrence.new
    recurrence.frequency = 1
    recurrence.day_of_week = 7
    recurrence.event = events(:salsa_event)

    refute recurrence.save, "Saved an invalid recurrence with an out-of-range day of the week"
  end
end
