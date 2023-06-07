class AddTotalPriceToBorangs < ActiveRecord::Migration[7.0]
  def change
    add_column :borangs, :total_price, :float
  end
end
