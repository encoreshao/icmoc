class UserDetail < ActiveRecord::Base
  attr_accessible :character, :contact_information, :educational_level, :habit_sleep, 
                  :habit_smoke, :habit_wine, :marriage, :profession, :somatotype
  belongs_to :user

end
