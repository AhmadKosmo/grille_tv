class Diffusion < ActiveRecord::Base
  belongs_to :programmes
  belongs_to :chaines
  validates :jour, presence: true
  validates :heure, presence: true
  validates :programme_id, presence: true
  validates :chaine_id, presence: true
end
