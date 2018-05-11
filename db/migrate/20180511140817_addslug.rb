class Addslug < ActiveRecord::Migration[5.1]
  def change
   add_column :activity_posts, :slug, :string, unique: true
   add_column :module_posts, :slug, :string, unique: true
  end
end
