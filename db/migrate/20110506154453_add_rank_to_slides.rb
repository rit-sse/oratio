class AddRankToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :rank, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :slides, :rank
  end
end
