# encoding: utf-8

class Province < ActiveRecord::Base
  include Concerns::HasScope

  attr_accessible :name, :name_en, :name_abbr, :promote

  validates :name, :name_en, :name_abbr, presence: true, uniqueness: true
  
  has_many :cities, dependent: :destroy
  has_many :districts, through: :cities

  def short_name
    @short_name ||= name.gsub(/市|省|自治州|自治区|回族|维吾尔|壮族|地区|特别行政区/, '')
  end

  def self.options
    @options ||= scoped.select('id, name').map{ |p| [p.name, p.id] }
  end

end# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  promote    :boolean(1)      default(FALSE)
#

# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  promote    :boolean(1)      default(FALSE)
#

# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  promote    :boolean(1)      default(FALSE)
#

# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  promote    :boolean(1)      default(FALSE)
#

# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  promote    :boolean(1)      default(FALSE)
#

# == Schema Information
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  promote    :boolean(1)      default(FALSE)
#

