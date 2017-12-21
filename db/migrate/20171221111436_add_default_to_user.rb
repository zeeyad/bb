class AddDefaultToUser < ActiveRecord::Migration[5.1]
  def change
  	change_column_default(:users, :type, 'Student')
  end
end
