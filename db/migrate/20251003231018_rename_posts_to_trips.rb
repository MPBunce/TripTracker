class RenamePostsToTrips < ActiveRecord::Migration[8.0]
  def change
    rename_table :posts, :trips
    
    # Update column names for clarity
    rename_column :trips, :content, :description if column_exists?(:trips, :content)
    
    # Add new date columns
    add_column :trips, :start_date, :date
    add_column :trips, :end_date, :date
  end
end