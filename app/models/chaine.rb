class Chaine < ActiveRecord::Base
  has_many :diffusions
  validates :nom, presence: true
end
