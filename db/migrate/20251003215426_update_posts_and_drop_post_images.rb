class UpdatePostsAndDropPostImages < ActiveRecord::Migration[8.0]
  def change
    # Drop the post_images table
    drop_table :post_images do |t|
      # Include the original schema here for rollback purposes
      # Adjust these columns based on your actual post_images table
      t.references :post, null: false, foreign_key: true
      t.string :image_url
      # Add other columns that were in your post_images table
      t.timestamps
    end

    # Update posts table
    change_table :posts do |t|
      # Remove longitude and latitude
      t.remove :longitude, type: :decimal
      t.remove :latitude, type: :decimal

      t.boolean :in_planning, default: true, null: true
    end
  end
end