class AddUsersToPsots < ActiveRecord::Migration[5.1]
  def change
    add_reference :cs_module_posts, :user, foreign_key: true
  end
end
