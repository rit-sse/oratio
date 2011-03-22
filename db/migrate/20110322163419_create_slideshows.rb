class CreateSlideshows < ActiveRecord::Migration
  def self.up
    create_table :slideshows do |t|
      t.string :name, :nil => false
      t.string :description
      t.boolean :visible, :nil => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :slideshows
  end
end
