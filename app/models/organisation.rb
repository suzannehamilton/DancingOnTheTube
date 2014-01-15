class Organisation < ActiveRecord::Base
  validates :name,
            presence: true,
            :uniqueness => {:case_sensitive => false}

  validates :url,
            presence: true
end
