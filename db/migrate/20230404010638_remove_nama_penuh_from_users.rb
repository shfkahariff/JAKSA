class RemoveNamaPenuhFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :nama_penuh, :string
  end
end
