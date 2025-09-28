# db/migrate/xxx_create_todo_lists.rb - REMOVE REDUNDANT INDEX
class CreateTodoLists < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_lists do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :completed, default: false
      t.references :trip, null: false, foreign_key: true
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :todo_lists, :trip_id
    
    add_index :todo_lists, :completed  # ✅ Keep - useful for filtering
  end
end