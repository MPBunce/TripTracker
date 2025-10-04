class DropFollows < ActiveRecord::Migration[8.0]
  def change
    drop_table :follows, if_exists: true
  end
end
