class RemoveDarjahNegeriFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :darjah_negeri, :string
  end
end
