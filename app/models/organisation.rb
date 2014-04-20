class Organisation < ActiveRecord::Base
  has_and_belongs_to_many :dances
  has_and_belongs_to_many :locations
  has_many :events

  validates :name,
            presence: true,
            :uniqueness => {:case_sensitive => false}

  validates :url,
            presence: true

  default_scope order(:name)

end
