class CreateEventPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :event_posts do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :venue
      t.time :start_time
      t.time :end_time
      t.references :user, foreign_key: true
	  t.integer :status, default: 0
      t.timestamps
    end
  end
end
