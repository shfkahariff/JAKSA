class RemoveDarjahNegeriIdFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :darjah_negeri_id, :integer
  end
end
