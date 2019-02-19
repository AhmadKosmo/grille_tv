class Programme < ActiveRecord::Base
  belongs_to :realisateur
  validates :titre, presence: true
  validates :type_programme, presence: true, inclusion: { in: ['Comedy',
    'Action',
    'Adventure',
    'Crime',
    'Drama',
    'Fantasy',
    'Historical',
    'Horror',
    'Romance',
    'Social']}
  validates :classification, presence: true, inclusion: { in: ['PEGI 3',
    'PEGI 7',
    'PEGI 12',
    'PEGI 16',
    'PEGI 18']}
    validates :realisateur_id, presence: true
end
