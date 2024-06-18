class Customer < ActiveRecord::Migration[7.1]
  def change
      create_table :customers do |t|
        t.string :email
        t.string :password_digest
        t.string :full_name
        t.string :country_code
        t.string :mobile_number
        t.boolean :terms_and_conditions
        t.timestamps
      end
  end
end
