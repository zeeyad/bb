class CreateActivityPost < ActiveRecord::Migration[5.1]
  def change
      add_column :activity_posts, :start_date, :date
      add_column :activity_posts, :end_date, :date
      add_column :activity_posts, :venue, :string
      add_column :activity_posts, :start_time, :time # Only if using reconfirmable  end
      add_column :activity_posts, :end_time, :time # Only if using reconfirmable  end
      add_column :activity_posts, :user_id, :integer # Only if using reconfirmable  end
      add_column :activity_posts, :status, :integer # Only if using reconfirmable  end
  end
end
