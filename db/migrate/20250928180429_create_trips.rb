# db/migrate/xxx_create_trips.rb
class CreateTrips < ActiveRecord::Migration[8.0]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.text :description
      t.string :destination
      t.date :start_date, null: false  
      t.date :end_date, null: false
      t.integer :status, default: 0, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    add_index :trips, :start_date
    add_index :trips, :status
  end
end