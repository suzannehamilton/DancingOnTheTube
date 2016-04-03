class Event < ActiveRecord::Base
  belongs_to :organisation

  has_one :weekly_recurrence, :inverse_of => :event
  accepts_nested_attributes_for :weekly_recurrence

  belongs_to :location

  validates :organisation, presence: true
  validates :location, presence: true
  validates :name, presence: true

  scope :today, -> { joins(:weekly_recurrence).where(weekly_recurrences: { day_of_week: Date.today.wday }) }

  def recurs_on_day? day_of_week
    !weekly_recurrence.nil? && weekly_recurrence.day_of_week == DateTime.parse(day_of_week.to_s).wday
  end
end
