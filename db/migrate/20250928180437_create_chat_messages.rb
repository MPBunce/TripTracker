# db/migrate/xxx_create_chat_messages.rb - CLEAN UP INDEXES
class CreateChatMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_messages do |t|
      t.text :content, null: false
      t.references :campfire_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :chat_messages, :campfire_room_id
    
    add_index :chat_messages, :created_at  # ✅ Keep - useful for sorting
  end
end