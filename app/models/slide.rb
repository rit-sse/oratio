# == Schema Information
# Schema version: 20110322204552
#
# Table name: slides
#
#  id            :integer         not null, primary key
#  content       :text
#  slide_type_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Slide < ActiveRecord::Base
  belongs_to :slide_type
end
