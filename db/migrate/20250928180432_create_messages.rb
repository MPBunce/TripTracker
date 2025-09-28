# db/migrate/xxx_create_messages.rb - REMOVE REDUNDANT INDEX
class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :message_board, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :messages, :message_board_id
    
    add_index :messages, :created_at  # ✅ Keep - useful for sorting
  end
end