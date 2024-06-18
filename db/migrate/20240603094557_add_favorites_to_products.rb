class AddFavoritesToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :favorites, :boolean, default: false
  end
end
