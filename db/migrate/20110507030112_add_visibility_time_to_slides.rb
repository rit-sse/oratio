class AddVisibilityTimeToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :visibility_time, :integer, :null => false, :default => 3000
  end

  def self.down
    remove_column :slides, :visibility_time
  end
end
