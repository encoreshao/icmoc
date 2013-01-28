class UserEducational < ActiveRecord::Base
  attr_accessible :school_name, :school_type, :year_in
  belongs_to :user
end
