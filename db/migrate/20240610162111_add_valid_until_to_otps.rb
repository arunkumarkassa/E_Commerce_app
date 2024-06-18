class AddValidUntilToOtps < ActiveRecord::Migration[7.1]
  def change
    add_column :otps, :valid_until, :datetime
  end
end
