class WeeklyRecurrence < ActiveRecord::Base
  belongs_to :event

  validates :event, presence: true
  validates :day_of_week, presence: true, :inclusion => 0..6
  validates :frequency, presence: true, :numericality => { :greater_than => 0 }
end
