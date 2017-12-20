class AddStatusToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :activity_posts, :status, :integer, default: 0
  end
end
