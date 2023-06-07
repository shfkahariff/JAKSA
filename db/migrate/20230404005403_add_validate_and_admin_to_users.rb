class AddValidateAndAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :validated, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
