class RemoveCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :price, :decimal
    remove_column :categories, :description, :text
  end
end
