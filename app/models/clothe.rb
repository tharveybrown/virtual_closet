class Clothe < ApplicationRecord
  belongs_to :closet
  has_one_attached :clothing_pic
  has_many :clothes_outfit
  has_many :outfits, through: :clothes_outfit
  validates :clothing_pic, presence: true
  validates :clothing_type, presence: true
  validates :pattern, presence: true
  validates :style, presence: true

  def self.random_shirt
    self.select {|c| c.clothing_type == "shirt"}.sample
  end
  
  def self.random_pants
    self.select {|c| c.clothing_type == "pant"}.sample
  end

end