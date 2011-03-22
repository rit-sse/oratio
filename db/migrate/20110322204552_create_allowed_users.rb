class CreateAllowedUsers < ActiveRecord::Migration
  def self.up
    create_table :allowed_users do |t|
      t.string :name, :null => false
      t.string :username, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :allowed_users
  end
end
