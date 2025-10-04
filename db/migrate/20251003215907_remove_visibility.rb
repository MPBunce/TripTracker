class RemoveVisibility < ActiveRecord::Migration[8.0]
  def change
      change_table :posts do |t|

        t.remove :visibility, type: :integer
    end
  end
end
