ActiveAdmin.register AboutU do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :image, :heading, :text
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :heading, :text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  config.filters = false
  permit_params :heading, :text

  index do
    selectable_column
    id_column
    column :heading
    column :text
    column :image do |about|
      if about.image.attached?
        image_tag url_for(about.image), size: "100x100"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :heading
      f.input :text
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :heading
      row :text
      row :image do |about|
        if about.image.attached?
          image_tag url_for(about.image), size: "200x200"
        end
      end
    end
  end

end
