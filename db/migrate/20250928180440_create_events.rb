# db/migrate/xxx_create_events.rb - CLEAN UP INDEXES
class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.string :location
      t.boolean :all_day, default: false
      t.references :schedule, null: false, foreign_key: true
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :events, :schedule_id
    
    add_index :events, :starts_at  # ✅ Keep - useful for sorting
  end
end