class Diffusion < ActiveRecord::Base
  has_many :programmes
  has_many :chaines
  validates :jour, presence: true
  validates :heure, presence: true
  validates :programme_id, presence: true
  validates :chaine_id, presence: true
end
