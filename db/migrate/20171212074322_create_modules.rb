class CreateModules < ActiveRecord::Migration[5.1]
  def change
    create_table :module_posts do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
