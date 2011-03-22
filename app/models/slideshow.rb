# == Schema Information
# Schema version: 20110322204552
#
# Table name: slideshows
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  visible     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Slideshow < ActiveRecord::Base
end
