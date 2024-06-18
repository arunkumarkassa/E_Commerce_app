class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :size, :colour, :favorites

  # def image_url
  #   Rails.application.routes.url_helpers.url_for(object.image) if object.image.attached?
  # end
end
