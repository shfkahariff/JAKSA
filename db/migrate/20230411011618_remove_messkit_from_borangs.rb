class RemoveMesskitFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :messkit, :string
  end
end
