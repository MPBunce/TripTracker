# db/migrate/xxx_create_schedules.rb - REMOVE REDUNDANT INDEX
class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.string :name, null: false
      t.text :description
      t.references :trip, null: false, foreign_key: true
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :schedules, :trip_id
  end
end