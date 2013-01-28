class UserHobby < ActiveRecord::Base
  attr_accessible :books, :brand, :favorite_people, :hobby, :movie, :music, :sports
  belongs_to :user
end
