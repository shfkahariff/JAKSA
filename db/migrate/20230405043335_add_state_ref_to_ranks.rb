class AddStateRefToRanks < ActiveRecord::Migration[7.0]
  def change
    add_reference :ranks, :state, foreign_key: true
  end
end
