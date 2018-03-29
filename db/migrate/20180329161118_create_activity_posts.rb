class CreateActivityPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_posts do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.string :activity_posts, :image_filename, :image

    end
  end
end
