class AddUserIdToBorangs < ActiveRecord::Migration[7.0]
  def change
    add_column :borangs, :user_id, :integer
    add_index :borangs, :user_id
  end
end
