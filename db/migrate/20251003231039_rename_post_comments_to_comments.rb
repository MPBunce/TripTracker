# db/migrate/20251003231039_rename_post_comments_to_comments.rb
class RenamePostCommentsToComments < ActiveRecord::Migration[8.0]
  def up
    return unless table_exists?(:post_comments)
    
    # Create new comments table with correct structure
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.text :content
      t.references :parent_comment, foreign_key: { to_table: :comments }
      t.timestamps
    end
    
    # Copy data from old table
    execute <<-SQL
      INSERT INTO comments (id, user_id, trip_id, content, parent_comment_id, created_at, updated_at)
      SELECT id, user_id, post_id, content, parent_comment_id, created_at, updated_at
      FROM post_comments
    SQL
    
    # Drop old table
    drop_table :post_comments
  end
  
  def down
    return unless table_exists?(:comments)
    
    create_table :post_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :content
      t.references :parent_comment, foreign_key: { to_table: :post_comments }
      t.timestamps
    end
    
    execute <<-SQL
      INSERT INTO post_comments (id, user_id, post_id, content, parent_comment_id, created_at, updated_at)
      SELECT id, user_id, trip_id, content, parent_comment_id, created_at, updated_at
      FROM comments
    SQL
    
    drop_table :comments
  end
end