class WeeklyRecurrence < ActiveRecord::Base
  belongs_to :event

  validates :event, presence: true
  validates :day_of_week, presence: true
end
