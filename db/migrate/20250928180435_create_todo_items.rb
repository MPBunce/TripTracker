# db/migrate/xxx_create_todo_items.rb - CLEAN UP INDEXES
class CreateTodoItems < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_items do |t|
      t.text :content, null: false
      t.text :notes
      t.boolean :completed, default: false
      t.date :due_date
      t.references :todo_list, null: false, foreign_key: true
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :assigned_to, null: true, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # ❌ REMOVE THESE - redundant with t.references
    # add_index :todo_items, :todo_list_id
    # add_index :todo_items, :assigned_to_id
    
    # ✅ KEEP THESE - useful for queries
    add_index :todo_items, :due_date
    add_index :todo_items, :completed
  end
end