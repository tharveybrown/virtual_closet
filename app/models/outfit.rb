class Outfit < ApplicationRecord
  belongs_to :closet
  has_many :clothes_outfit
  has_many :clothes, through: :clothes_outfit
  validates_length_of :clothes, :minimum => 2



  def random_pants
    self.closet.clothes.select {|c| c.clothing_type == "pant"}.sample
  end
  
  def random_shirt
    self.closet.clothes.select {|c| c.clothing_type == "shirt"}.sample
  end

  def random_shorts
    self.closet.clothes.select {|c| c.clothing_type == "short"}.sample
  end

  def random_jacket
    self.closet.clothes.select {|c| c.clothing_type == "jacket"}.sample
  end

  def random_sweatshirt
    self.closet.clothes.select {|c| c.clothing_type == "sweatshirt"}.sample
  end

  def clothes_for_weather(weather)
    case weather
    when 50..60
      self.random_sweatshirt ? self.clothes << self.random_sweatshirt : flash[:warning] << "You should add a sweatshirt!"
    when 0..50
      self.random_jacket ? self.clothes << self.random_jacket : flash[:warning] << "You should add a jacket!"
    when 80..150
      self.random_shorts ? self.clothes << self.random_shorts : flash[:warning] << "You should add some shorts!"
      shorts = self.random_shorts
    end
  end


end