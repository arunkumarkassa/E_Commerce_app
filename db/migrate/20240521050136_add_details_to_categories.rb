class AddDetailsToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :image, :string
    add_column :categories, :category_type, :string
    add_column :categories, :price, :decimal
  end
end
