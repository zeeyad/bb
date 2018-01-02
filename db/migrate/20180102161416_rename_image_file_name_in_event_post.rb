class RenameImageFileNameInEventPost < ActiveRecord::Migration[5.1]
  def change
  	rename_column :event_posts, :image_filename, :image
  end
end
