# db/migrate/xxx_create_campfire_rooms.rb - REMOVE REDUNDANT INDEX
class CreateCampfireRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :campfire_rooms do |t|
      t.string :name, null: false
      t.text :description
      t.references :trip, null: false, foreign_key: true
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :campfire_rooms, :trip_id
  end
end