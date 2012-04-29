# == Schema Information
#
# Table name: participants
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  call_id    :integer
#  email      :string(255)
#

class Participant < ActiveRecord::Base
  attr_accessible :name, :phone, :email
  belongs_to :call
end
