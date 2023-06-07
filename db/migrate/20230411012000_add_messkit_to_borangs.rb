class AddMesskitToBorangs < ActiveRecord::Migration[7.0]
  def change
    add_column :borangs, :messkit, :text
  end
end
