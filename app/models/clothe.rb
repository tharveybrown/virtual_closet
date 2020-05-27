class Clothe < ApplicationRecord
  belongs_to :closet
  has_one_attached :clothing_pic
  has_many :clothes_outfit
  has_many :outfits, through: :clothes_outfit
  validates :clothing_pic, presence: true
  validates :clothing_type, presence: true
  validates :pattern, presence: true
  validates :style, presence: true
end