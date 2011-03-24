# == Schema Information
# Schema version: 20110322204552
#
# Table name: allowed_users
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  username   :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class AllowedUsers < ActiveRecord::Base
end
