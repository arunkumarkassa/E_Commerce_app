ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :price, :colour, :image, :user_id, :size
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :price, :colour, :image, :user_id, :size]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  config.filters = false
  permit_params :user_id, :title, :description, :price, :image, :size, :colour, :favorites

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :size
    column :colour
    column :favorites
    column :image do |product|
      if product.image.attached?
        image_tag url_for(product.image), size: "100x100"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :size, as: :select, collection: ["S", "M", "L", "XL"]
      f.input :colour, as: :select, collection: ["Blue", "Yellow", "Red", "green" ]
      f.input :favorites, as: :select, collection: [['Yes', true], ['No', false]]
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :price
      row :size
      row :colour
      row :favorites
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), size: "200x200"
        end
      end
    end
  end
end
