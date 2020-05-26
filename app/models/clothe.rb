class Clothe < ApplicationRecord
  belongs_to :closet
  has_one_attached :clothing_pic
  has_many :clothes_outfits
  has_many :outfits, through: :clothes_outfits
end