class Outfit < ApplicationRecord
  belongs_to :closet
  has_many :clothes_outfit
  has_many :clothes, through: :clothes_outfit
  # validate :require_top, :require_bottom


  def self.random_clothes
    clothes = []
    clothes << self.closet.clothes.select {|c| c.clothing_type == "pant"}.sample
    clothes << self.closet.clothes.select {|c| c.clothing_type == "shirt"}.sample
    clothes
    byebug
  end

  private 
  def require_bottom
    bottoms = clothes.select{|c| c.clothing_type == "pant" || c.clothing_type == "short"}.count
    if bottoms == 0 || bottoms > 1
      errors.add(:clothing_type, "Please select bottoms")
    end
  end

  def require_top
    shirts = clothes.select{|c| c.clothing_type == 'shirt'}.count
    if shirts == 0 || shirts > 1
      errors.add(:type, "Please select one shirt")
    end
  end

  

end