# db/migrate/xxx_create_message_boards.rb
class CreateMessageBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :message_boards do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :pinned, default: false
      t.references :trip, null: false, foreign_key: true  # This already creates the index!
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # Keep this one since it's different:
    add_index :message_boards, :pinned
  end
end