class AddBorangReferenceToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :borang_id, :bigint
    add_foreign_key :payments, :borangs
  end
end
