class Outfit < ApplicationRecord
  belongs_to :closet
  has_many :clothes_outfit
  has_many :clothes, through: :clothes_outfit
end