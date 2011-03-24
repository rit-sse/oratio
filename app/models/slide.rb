# == Schema Information
# Schema version: 20110322204552
#
# Table name: slides
#
#  id            :integer         not null, primary key
#  content       :text
#  slide_type_id :integer         not null
#  slideshow_id  :integer         not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Slide < ActiveRecord::Base
  belongs_to :slideshow
  belongs_to :slide_type
end
