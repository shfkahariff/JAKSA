class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :negeri

      t.timestamps
    end
  end
end
