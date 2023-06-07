class RemoveNoKenderaansFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :no_kenderaans, :string
  end
end
