class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :title, :null => false
      t.text :content
      t.references :slide_type, :null => false
      t.references :slideshow, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
