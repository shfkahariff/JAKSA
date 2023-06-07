class SetStartingUserId < ActiveRecord::Migration[7.0]
  def up
    execute "ALTER TABLE users AUTO_INCREMENT = 50000;"
  end

  def down
    # No need to do anything here
  end
end
