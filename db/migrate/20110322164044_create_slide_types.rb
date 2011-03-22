class CreateSlideTypes < ActiveRecord::Migration
  def self.up
    create_table :slide_types do |t|
      t.string :name, :nil => false

      t.timestamps
    end
  end

  def self.down
    drop_table :slide_types
  end
end
