# encoding: utf-8

class City < ActiveRecord::Base
  include Concerns::HasScope
  
  attr_accessible :name, :province_id, :level, :zip_code, :name_en, :name_abbr

  validates :name, :name_en, :name_abbr, :province_id, presence: true
  validates :name, :name_en, :name_abbr, uniqueness: { scope: :province_id }
  
  belongs_to :province
  has_many :districts, dependent: :destroy

  scope :with_province, ->(province) { where(province_id: province) }

  def short_name
    @short_name ||= name.gsub(/市|自治州|地区|特别行政区/, '')
  end

  def siblings
    @siblings ||= scoped.with_province(self.province_id)
  end

end
# == Schema Information
#
# Table name: cities
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  province_id :integer(4)
#  level       :integer(4)
#  zip_code    :string(255)
#  name_en     :string(255)
#  name_abbr   :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

