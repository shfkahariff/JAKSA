class RemoveNoIcFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :no_ic, :string
  end
end
