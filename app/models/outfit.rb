class Outfit < ApplicationRecord
  belongs_to :closet
  has_many :clothes_outfit
  has_many :clothes, through: :clothes_outfit
  validates :clothes
  validate :require_top
  # accepts_nested_attributes_for :clothes

  def 

  def self.random_outfit
    clothes = []
    clothes << Clothe.select {|c| c.clothing_type == "pant" || c.clothing_type == "jean" || c.clothing_type == "short"}.sample
    clothes << Clothe.select {|c| c.clothing_type == "t-shirt" || c.clothing_type == "top"}.sample
    @outfit = Outfit.new
    @outfit.clothes = clothes
    @outfit.save
  end

  private 
  def require_bottom
    bottoms = clothes.select{|c| c.clothing_type == "pant" || c.clothing_type == "jean" || c.clothing_type == "short"}.count
    if bottoms == 0 || bottoms > 1
      errors.add(:clothing_type, "Please select bottoms")
    end
  end

  def require_top
    t-shirts = clothes.select{|c| c.clothing_type == 't-shirt'}.count
    tops = clothes.select{|c| c.clothing_type == 'top'}.count
    if t-shirts + tops == 0
      errors.add(:type, "Please select at least one top")
    elsif t-shirts > 1 
      errors.add(:type, "Too many shirts!")
    elsif tops > 1
      errors.add(:type, "Too many tops!")
    end
  end

end