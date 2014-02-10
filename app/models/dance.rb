class Dance < ActiveRecord::Base
  has_and_belongs_to_many :organisations

  validates :name,
            presence: true,
            :uniqueness => {:case_sensitive => false}

  default_scope order(:name)
end
