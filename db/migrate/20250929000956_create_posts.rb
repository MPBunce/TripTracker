class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :location
      t.integer :post_type
      t.integer :visibility
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
