class AddImageToActivityPost < ActiveRecord::Migration[5.1]
  def change
    add_column :activity_posts, :image_filename, :string
  end
end
