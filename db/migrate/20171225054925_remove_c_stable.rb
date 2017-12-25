class RemoveCStable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :cs_activity_posts
  	drop_table :cs_module_posts
  	drop_table :cs_event_posts
  end
end
