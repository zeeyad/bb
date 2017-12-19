class AddSlugToCsActivityPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :cs_activity_posts, :slug, :string, unique: true
  end
end
