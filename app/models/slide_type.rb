# == Schema Information
# Schema version: 20110322204552
#
# Table name: slide_types
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class SlideType < ActiveRecord::Base

  def is_calendar?
    self.name.downcase == "calendar"
  end

  def is_photos?
    self.name.downcase == "photos"
  end

end
