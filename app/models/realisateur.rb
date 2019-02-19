class Realisateur < ActiveRecord::Base
  has_many :programmes
  validates :nom, presence: true
end
