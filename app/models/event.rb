class Event < ActiveRecord::Base
  belongs_to :organisation
  has_one :weekly_recurrence
  accepts_nested_attributes_for :weekly_recurrence

  validates :organisation, presence: true
  validates :name, presence: true
end
