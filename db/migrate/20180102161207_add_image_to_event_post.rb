class AddImageToEventPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :event_posts, :image_filename, :string
  end
end
