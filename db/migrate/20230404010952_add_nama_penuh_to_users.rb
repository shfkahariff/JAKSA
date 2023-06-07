class AddNamaPenuhToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nama_penuh, :string
  end
end
