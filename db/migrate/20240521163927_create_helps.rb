class CreateHelps < ActiveRecord::Migration[7.1]
  def change
    create_table :helps do |t|
      t.string :image
      t.text :text

      t.timestamps
    end
  end
end
