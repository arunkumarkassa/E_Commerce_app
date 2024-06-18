class Product < ApplicationRecord
  has_many :favorites
  has_one_attached :image
  validates :favorites, inclusion: { in: [true, false] }
  COLOUR = ["Blue", "Yellow", "Red", "green"]
  validates :colour, inclusion: { in: COLOUR }
  SIZE = ["S", "M", "L", "XL"]
  validates :size, inclusion: { in: SIZE }
end
