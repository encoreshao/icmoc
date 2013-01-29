class UserEducational < ActiveRecord::Base
  attr_accessible :school_name, :school_type, :year_in
  belongs_to :user
end
# == Schema Information
#
# Table name: user_educationals
#
#  id          :integer(4)      not null, primary key
#  school_type :integer(4)
#  school_name :string(255)
#  year_in     :integer(4)
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

