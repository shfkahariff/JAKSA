class RemoveDarjahKebesaranIdFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :darjah_kebesaran_id, :integer
  end
end
