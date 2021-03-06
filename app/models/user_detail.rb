class UserDetail < ActiveRecord::Base
  attr_accessible :character, :contact_information, :educational_level, :habit_sleep, 
                  :habit_smoke, :habit_wine, :marriage, :profession, :somatotype
  belongs_to :user
end
# == Schema Information
#
# Table name: user_details
#
#  id                  :integer(4)      not null, primary key
#  somatotype          :integer(4)
#  marriage            :integer(4)
#  habit_smoke         :integer(4)
#  habit_wine          :integer(4)
#  habit_sleep         :integer(4)
#  character           :string(255)
#  educational_level   :integer(4)
#  profession          :integer(4)
#  contact_information :string(255)
#  user_id             :integer(4)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

