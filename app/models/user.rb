class User < ApplicationRecord
  has_one :closet
  has_many :clothes, through: :closet
  has_many :outfits, through: :closet
  has_secure_password
  has_one :closet
  has_many :clothes, through: :closet
end
