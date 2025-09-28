# db/migrate/xxx_create_comments.rb - REMOVE REDUNDANT INDEX
class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :message, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :comments, :message_id
    
    add_index :comments, :created_at  # ✅ Keep - useful for sorting
  end
end