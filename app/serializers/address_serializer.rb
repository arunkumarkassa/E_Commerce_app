class AddressSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :street, :landmark, :area, :city, :district, :pin_code, :state, :country, :address_type

  belongs_to :customer
end
