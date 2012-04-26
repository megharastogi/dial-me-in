# == Schema Information
#
# Table name: calls
#
#  id         :integer         not null, primary key
#  time       :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Call < ActiveRecord::Base
  attr_accessible :time
  has_many :participants
end