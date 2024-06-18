class Customer < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :addresses
  validates :full_name, presence: true
  validates :country_code, presence: true
  validates :mobile_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :terms_and_conditions, inclusion: { in: [true, false] }
end
