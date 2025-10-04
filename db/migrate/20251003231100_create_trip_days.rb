class CreateTripDays < ActiveRecord::Migration[8.0]
  def change
    create_table :trip_days do |t|
      t.references :trip, null: false, foreign_key: true
      t.integer :day_number, null: false
      t.date :date
      t.string :title
      t.text :description
      t.string :location
      
      t.timestamps
    end
    
    add_index :trip_days, [:trip_id, :day_number], unique: true
  end
end
