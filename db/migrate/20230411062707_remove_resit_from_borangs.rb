class RemoveResitFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :resit, :string
  end
end
