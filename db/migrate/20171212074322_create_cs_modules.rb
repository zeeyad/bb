class CreateCsModules < ActiveRecord::Migration[5.1]
  def change
    create_table :cs_module_posts do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
