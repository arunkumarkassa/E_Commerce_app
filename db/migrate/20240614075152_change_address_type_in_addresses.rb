class ChangeAddressTypeInAddresses < ActiveRecord::Migration[7.1]
  def change
    change_column :addresses, :address_type, :string
  end
end
