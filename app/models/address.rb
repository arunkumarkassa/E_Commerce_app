class Address < ApplicationRecord
  belongs_to :customer
  ADDRESS_TYPES = ['home', 'office'].freeze

  validates :house_number, :street, :landmark, :area, :city, :district, :pin_code, :state, :country, :address_type, presence: true
  validates :address_type, inclusion: { in: ADDRESS_TYPES }
end
