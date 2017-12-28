class RenameImageFilename < ActiveRecord::Migration[5.1]
  def change
  	rename_column :activity_posts, :image_filename, :image
  end
end
