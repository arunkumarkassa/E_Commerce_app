class AddCustomerIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_reference :favorites, :customer, null: false, foreign_key: true
  end
end
