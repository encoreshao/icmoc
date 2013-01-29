# encoding: utf-8

class District < ActiveRecord::Base
	include Concerns::HasScope
	
  attr_accessible :name, :city_id, :name_en, :name_abbr

  validates :name, :name_en, :name_abbr, :city_id, presence: true
  validates :name, :name_en, :name_abbr, uniqueness: { scope: :city_id }
  
	belongs_to :city

	scope :with_city, ->(city) { where(city_id: city) }

	def province
		city.province
	end
	
	def short_name
		@short_name ||= name.gsub(/区|县|市|自治县/, '')
	end
	
	def siblings
		@siblings ||= scoped.with_city(self.city_id)
	end
	
end
# == Schema Information
#
# Table name: districts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  city_id    :integer(4)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

