class Clothe < ApplicationRecord
  belongs_to :closet
  has_one_attached :clothing_pic
  has_many :clothes_outfit
  has_many :outfits, through: :clothes_outfit
end