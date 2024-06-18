class AddOtpToUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :otps do |t|
      t.string :otps
      t.integer :customer_id
      t.timestamps
    end
  end
end
