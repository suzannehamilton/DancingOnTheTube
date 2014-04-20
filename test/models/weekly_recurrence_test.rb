require 'test_helper'

class WeeklyRecurrenceTest < ActiveSupport::TestCase
  test "a valid event can be saved" do
    recurrence = validRecurrence

    assert recurrence.save, "Did not save a valid recurrence"
  end

  test "a recurrence cannot be saved without an event" do
    recurrence = validRecurrence
    recurrence.event = nil

    refute recurrence.save, "Saved an invalid recurrence that was not connected to an event"
  end

  test "a recurrence cannot be saved without a day of the week" do
    recurrence = validRecurrence
    recurrence.day_of_week = nil

    refute recurrence.save, "Saved an invalid recurrence that was not tied to a day of the week"
  end

  test "a negative day of the week is invalid" do
    recurrence = validRecurrence
    recurrence.day_of_week = -1
    recurrence.event = events(:salsa_event)

    refute recurrence.save, "Saved an invalid recurrence with a negative day of the week"
  end

  test "a day of the week of 7 or greater is invalid" do
    recurrence = validRecurrence
    recurrence.day_of_week = 7

    refute recurrence.save, "Saved an invalid recurrence with an out-of-range day of the week"
  end

  test "a recurrence cannot be saved without a frequency" do
    recurrence = validRecurrence
    recurrence.frequency = nil

    refute recurrence.save, "Saved an invalid recurrence with no frequency"
  end

  test "frequency cannot be zero" do
    recurrence = validRecurrence
    recurrence.frequency = 0
    recurrence.event = events(:salsa_event)

    refute recurrence.save, "Saved an invalid recurrence with zero frequency"
  end

  test "frequency cannot be negative" do
    recurrence = validRecurrence
    recurrence.frequency = -1

    refute recurrence.save, "Saved an invalid recurrence with negative frequency"
  end

  def validRecurrence
    recurrence = WeeklyRecurrence.new
    recurrence.day_of_week = 0
    recurrence.frequency = 1
    recurrence.event = events(:salsa_event)
    recurrence
  end
end
