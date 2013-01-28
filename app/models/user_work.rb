class UserWork < ActiveRecord::Base
  attr_accessible :end_month, :end_year, :start_month, :start_year, :unit_name
  belongs_to :user
end
