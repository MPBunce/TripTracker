# db/migrate/xxx_create_documents.rb - CLEAN UP INDEXES
class CreateDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.text :description
      t.references :trip, null: false, foreign_key: true
      t.references :uploaded_by, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
    
    # ❌ REMOVE THIS - redundant with t.references
    # add_index :documents, :trip_id
    
    add_index :documents, :created_at  # ✅ Keep - useful for sorting
  end
end