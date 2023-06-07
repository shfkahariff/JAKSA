class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :payment_status
      t.string :order_number
      t.string :buyer_name
      t.string :buyer_phone
      t.string :buyer_email
      t.string :payment_id
      t.string :status_url
      t.string :retry_url
      t.string :receipt_url

      t.timestamps
    end
  end
end
