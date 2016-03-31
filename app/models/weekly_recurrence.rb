class WeeklyRecurrence < ActiveRecord::Base
  belongs_to :event

  validates :day_of_week, presence: true, :inclusion => 0..6
end
