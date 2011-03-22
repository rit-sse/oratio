class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.text :content
      t.references :slide_type

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
