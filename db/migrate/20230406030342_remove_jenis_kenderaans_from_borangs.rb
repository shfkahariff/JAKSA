class RemoveJenisKenderaansFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :jenis_kenderaans, :string
  end
end
