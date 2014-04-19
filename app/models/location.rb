class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :latitude, presence: true
end
