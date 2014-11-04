class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :body
      t.boolean :complete

      t.timestamps
    end
  end
end
