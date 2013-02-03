class UserPromptProblem < ActiveRecord::Base
  attr_accessible :answer, :frequency, :problem, :user_id

  belongs_to :user

  validates :problem, :answer, presence: true
end
# == Schema Information
#
# Table name: user_prompt_problems
#
#  id         :integer(4)      not null, primary key
#  problem    :string(255)
#  answer     :string(255)
#  frequency  :integer(4)      default(0)
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

