# == Schema Information
# Schema version: 20110322204552
#
# Table name: slideshows
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  visible     :boolean         default(TRUE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Slideshow < ActiveRecord::Base
  has_many :slides
end
