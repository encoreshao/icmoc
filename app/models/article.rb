class Article < ActiveRecord::Base
  attr_accessible :swap_name, :wish_name, :code, :description, :phone, :price, :qq, 
                  :view_count, :condition, :province_id, :city_id, :district_id, 
                  :sku, :slug, :image, :category_id, :user_id, :publish_at, :article_level_id

  paginates_per 25

  mount_uploader :image, ArticleImageUploader
  validates :swap_name, :wish_name, :user_id, :category_id, :province_id, presence: true

  belongs_to :user
  belongs_to :province
  belongs_to :category
  belongs_to :article_level

  scope :with_name, ->(name) { name.blank? ? nil : where("swap_name LIKE ? OR wish_name LIKE ?", "%#{name}%", "%#{name}%") }
  scope :with_province, ->(prov) { 
    prov.blank? ? nil : 
      joins(:province).where("provinces.name_abbr = ?", prov) 
  }

  def view_count_incr
    
  end

end
# == Schema Information
#
# Table name: articles
#
#  id               :integer(4)      not null, primary key
#  swap_name        :string(255)
#  wish_name        :string(255)
#  price            :float
#  qq               :string(255)
#  phone            :string(255)
#  condition        :string(255)
#  description      :text
#  sku              :string(255)
#  code             :string(255)
#  slug             :string(255)
#  view_count       :integer(4)
#  province_id      :integer(4)
#  city_id          :integer(4)
#  district_id      :integer(4)
#  user_id          :integer(4)
#  category_id      :integer(4)
#  article_level_id :integer(4)
#  image            :string(255)
#  publish_at       :datetime
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

