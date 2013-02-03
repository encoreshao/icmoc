require 'spec_helper'

describe UserPromptProblem do
  pending "add some examples to (or delete) #{__FILE__}"
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

