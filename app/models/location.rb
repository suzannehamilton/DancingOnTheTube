class Location < ActiveRecord::Base
  has_and_belongs_to_many :organisations

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
