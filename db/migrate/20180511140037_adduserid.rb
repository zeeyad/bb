class Adduserid < ActiveRecord::Migration[5.1]
  def change
   add_column :module_posts, :user_id, :integer, :references => "users"
  end
end
