class UserEducational < ActiveRecord::Base
  attr_accessible :school_name, :school_type, :year_in, :indexing
  belongs_to :user

  validates :school_name, presence: true
  validates :school_type, presence: true

  scope :with_type, lambda { |type| where(school_type: type) }
  before_create :calculate_type_index

  private
    def calculate_type_index
      self.indexing = (user.educationals.with_type(self.school_type).size > 0 ? user.educationals.with_type(self.school_type).last.indexing + 1 : 0)
    end

end
# == Schema Information
#
# Table name: user_educationals
#
#  id          :integer(4)      not null, primary key
#  school_type :integer(4)
#  indexing    :integer(4)
#  school_name :string(255)
#  year_in     :datetime
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

