class Event < ActiveRecord::Base
  belongs_to :organisation

  validates :organisation, presence: true
  validates :name, presence: true
  validates :start_date, presence: true
end
