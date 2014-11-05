class CreateHexes < ActiveRecord::Migration
  def change
    create_table :hexes do |t|
      t.string  :image_url
      t.integer :user_id
      t.string :background_color
      t.timestamps
    end
  end
end
