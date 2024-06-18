class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :house_number
      t.string :street
      t.string :landmark
      t.string :area
      t.string :city
      t.string :district
      t.string :pin_code
      t.string :state
      t.string :country
      t.integer :address_type
      t.timestamps
    end
  end
end
