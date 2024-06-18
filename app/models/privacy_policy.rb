class PrivacyPolicy < ApplicationRecord
  has_one_attached :image

  validates :text, presence: true
  validates :image, presence: true
end
