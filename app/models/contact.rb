class Contact < ActiveRecord::Base
  include Concerns::HasScope
  
  attr_accessible :content, :email, :mobile, :name

  belongs_to :user
end
# == Schema Information
#
# Table name: contacts
#
#  id         :integer(4)      not null, primary key
#  email      :string(255)
#  name       :string(255)
#  mobile     :string(255)
#  content    :text
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

