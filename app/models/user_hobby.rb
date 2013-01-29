class UserHobby < ActiveRecord::Base
  attr_accessible :books, :brand, :favorite_people, :hobby, :movie, :music, :sports
  belongs_to :user
end
# == Schema Information
#
# Table name: user_hobbies
#
#  id              :integer(4)      not null, primary key
#  books           :string(255)
#  music           :string(255)
#  movie           :string(255)
#  sports          :string(255)
#  brand           :string(255)
#  favorite_people :string(255)
#  hobby           :string(255)
#  user_id         :integer(4)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

