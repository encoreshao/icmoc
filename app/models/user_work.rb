class UserWork < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :unit_name, :indexing
  belongs_to :user
  
  validates :unit_name, presence: true

  before_create :calculate_type_index

  private
    def calculate_type_index
      self.indexing = (user.works.size > 0 ? user.works.last.indexing + 1 : 0)
    end
end
# == Schema Information
#
# Table name: user_works
#
#  id         :integer(4)      not null, primary key
#  unit_name  :string(255)
#  start_time :datetime
#  end_time   :datetime
#  indexing   :integer(4)
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

