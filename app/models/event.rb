class Event < ActiveRecord::Base
  belongs_to :organisation

  validates :name, presence: true
end
