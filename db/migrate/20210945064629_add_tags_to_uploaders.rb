class AddTagsToUploaders < ActiveRecord::Migration
  def change
    add_column :uploaders, :tags, :string, null: true
  end
end
