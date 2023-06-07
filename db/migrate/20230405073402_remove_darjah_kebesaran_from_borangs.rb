class RemoveDarjahKebesaranFromBorangs < ActiveRecord::Migration[7.0]
  def change
    remove_column :borangs, :darjah_kebesaran, :string
  end
end
