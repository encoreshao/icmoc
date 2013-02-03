class Category < ActiveRecord::Base
  include Concerns::HasScope
  attr_accessible :code, :name, :name_en, :slug, :level, :parent_id, :promotion, :is_active

  validates :name, presence: true, uniqueness: { scope: :parent_id }, :if => Proc.new { |c| not c.is_active }

  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id'
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"

  def self.tags
    where(parent_id: nil).select('id, name')
  end
end
# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  level      :integer(4)
#  parent_id  :integer(4)
#  promotion  :boolean(1)      default(FALSE)
#  is_active  :boolean(1)      default(TRUE)
#  code       :string(255)
#  slug       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

