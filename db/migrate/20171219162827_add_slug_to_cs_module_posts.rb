class AddSlugToCsModulePosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :cs_module_posts, :slug, :string, unique: true
  end
end
