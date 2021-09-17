class CreateUploaders < ActiveRecord::Migration
  def change
    create_table :uploaders do |t|
      t.string :title
      t.integer :user_id
      t.string :description
      t.string :attachment

      t.timestamps null: false
    end
    add_index :uploaders, :user_id
  end
end
