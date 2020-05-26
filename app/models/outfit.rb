class Outfit < ApplicationRecord
  belongs_to :closet
  has_many :clothes_outfits
  has_many :clothes, through: :clothes_outfits
end