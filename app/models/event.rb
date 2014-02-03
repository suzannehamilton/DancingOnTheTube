class Event < ActiveRecord::Base
  belongs_to :organisation

  validates :name, presence: true
  validates :start_date, presence: true
end
