class CreateTermsAndConditions < ActiveRecord::Migration[7.1]
  def change
    create_table :terms_and_conditions do |t|
      t.string :image
      t.text :text

      t.timestamps
    end
  end
end
