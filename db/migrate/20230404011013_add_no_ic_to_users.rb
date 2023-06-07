class AddNoIcToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :no_ic, :string
  end
end
