class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :body
      t.references :admin, index: true

      t.timestamps
    end
  end
end
