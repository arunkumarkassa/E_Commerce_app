class ChangeUserIdToCustomerId < ActiveRecord::Migration[7.1]
  def change
    remove_column :favorites, :user_id, :bigint
  end
end
