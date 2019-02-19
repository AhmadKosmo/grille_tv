class Chaine < ActiveRecord::Base
  validates :nom, presence: true
end
