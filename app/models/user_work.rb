class UserWork < ActiveRecord::Base
  attr_accessible :end_month, :end_year, :start_month, :start_year, :unit_name
  belongs_to :user
end
# == Schema Information
#
# Table name: user_works
#
#  id          :integer(4)      not null, primary key
#  unit_name   :string(255)
#  start_year  :integer(4)
#  start_month :integer(4)
#  end_year    :integer(4)
#  end_month   :integer(4)
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

