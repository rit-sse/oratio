# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

unless AllowedUsers.count > 0
  AllowedUsers.create([
    { :name => "Cody Krieger", :username => "cjk7752" },
    { :name => "Brian Wyant", :username => "bmw8952" },
    { :name => "Brian To", :username => "bxt5647" },
    { :name => "Danjo", :username => "dgj7531" }
    ])
end

unless Slideshow.count > 0
  Slideshow.create([
    {
      :name => "Slideshow 1", 
      :description => "Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt."
    },
    {
      :name => "Slideshow 2",
      :description => "Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt."
    },
    {
      :name => "Slideshow 3",
      :description => "Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt."
    },
    {
      :name => "Slideshow 4",
      :description => "Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt."
    }
    ])
end

unless SlideType.count > 0
  SlideType.create([
    { :name => "Default" },
    { :name => "Calendar" },
    { :name => "Photos" },
    { :name => "RSS Feed" }
    ])
end

# unless Slide.count > 0
#   Slideshow.all.each do |slideshow|
#     Slide.create([
#       { :title => "Slide 1", :slideshow_id => slideshow.id, :content => '<h2 class="hcenter vcenter">testing</h2>' }
#       ])
#   end
# end
