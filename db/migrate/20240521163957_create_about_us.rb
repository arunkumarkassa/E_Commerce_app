class CreateAboutUs < ActiveRecord::Migration[7.1]
  def change
    create_table :about_us do |t|
      t.string :image
      t.string :heading
      t.text :text

      t.timestamps
    end
  end
end
