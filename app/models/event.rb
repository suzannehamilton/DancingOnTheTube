class Event < ActiveRecord::Base
  belongs_to :organisation

  has_one :weekly_recurrence, :inverse_of => :event
  accepts_nested_attributes_for :weekly_recurrence

  belongs_to :location

  validates :organisation, presence: true
  validates :location, presence: true
  validates :name, presence: true

  validate :location_must_be_a_location_associated_with_organisation

  def location_must_be_a_location_associated_with_organisation
    if (organisation.nil?) || (!organisation.locations.include? location)
      errors.add(:location, "must be one of the parent organisation's locations")
    end
  end
end
