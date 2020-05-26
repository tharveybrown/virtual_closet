class Closet < ApplicationRecord
  belongs_to :user
  has_many :clothes
  has_many :outfits
end

