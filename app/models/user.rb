class User < ApplicationRecord
  has_secure_password
  has_one :closet
  has_many :clothes, through: :closet
end
