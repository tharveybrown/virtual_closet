class User < ApplicationRecord
  has_one :closet
  has_many :clothes, through: :closet
  has_many :outfits, through: :closet
  has_secure_password
  has_one :closet
  has_many :clothes, through: :closet
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true
  geocoded_by :address
  

  after_validation :geocode
  

  def city
    result = Geocoder.search([self.latitude, self.longitude])
    result.first.city
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
