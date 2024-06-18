ActiveAdmin.register TermsAndConditions do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :image, :text
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  config.filters = false
  permit_params :text, :image

  index do
    selectable_column
    id_column
    column :text
    column :image do |terms|
      if terms.image.attached?
        image_tag url_for(terms.image), size: "100x100"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :text
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :text
      row :image do |terms|
        if terms.image.attached?
          image_tag url_for(terms.image), size: "200x200"
        end
      end
    end
  end


  # permit_params :image, :text

  # index do
  #   selectable_column
  #   id_column
  #   column :image
  #   column :text
  #   column :created_at
  #   column :updated_at
  #   actions
  # end

  # form do |f|
  #   f.inputs do
  #     f.input :image
  #     f.input :text
  #   end
  #   f.actions
  # end

end
