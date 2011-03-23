class AddCodyAndBrianToAllowedUsersTable < ActiveRecord::Migration
  def self.up
    AllowedUsers.create :name => 'Cody Krieger', :username => 'cjk7752'
    AllowedUsers.create :name => 'Brian To',     :username => 'bxt5647'
  end

  def self.down
    AllowedUsers.where(:username => 'cjk7752').delete
    AllowedUsers.where(:username => 'bxt5647').delete
  end
end
