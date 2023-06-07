class AddTransactionAmountToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :transaction_amount, :float
  end
end
