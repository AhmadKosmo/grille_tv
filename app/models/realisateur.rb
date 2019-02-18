class Realisateur < ActiveRecord::Base
  validates :nom, presence: true
end
