class Category < ApplicationRecord
  has_many :sub_categories
  has_one_attached :image
  validates :name, presence: true
  CATEGORY_TYPES = ["mens wear", "womens wear", "kids wear", "jeans & trousers", "outer wear", "baby wear"]
  validates :category_type, inclusion: { in: CATEGORY_TYPES }

end
