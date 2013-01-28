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
