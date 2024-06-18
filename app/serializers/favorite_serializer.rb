class FavoriteSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :customer
  belongs_to :product
end
