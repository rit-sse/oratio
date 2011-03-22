class CreateAllowedUsers < ActiveRecord::Migration
  def self.up
    create_table :allowed_users do |t|
      t.string :name, :nil => false
      t.string :username, :nil => false

      t.timestamps
    end
  end

  def self.down
    drop_table :allowed_users
  end
end
