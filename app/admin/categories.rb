ActiveAdmin.register Category do
  config.filters = false

  permit_params :name, :image, :category_type

  index do
    selectable_column
    id_column
    column :name
    column :category_type
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :category_type, as: :select, collection: ["mens wear", "womens wear", "kids wear", "jeans & trousers", "outer wear", "baby wear"]
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :category_type
      row :created_at
      row :updated_at
      row :image do |category|
        if category.image.attached?
          image_tag url_for(category.image), size: "200x200"
        end
      end
    end
  end
end
