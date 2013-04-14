class Article < ActiveRecord::Base
  include Concerns::HasScope
  attr_accessible :swap_name, :wish_name, :code, :description, :phone, :price, :qq, 
                  :view_count, :condition, :province_id, :city_id, :district_id, 
                  :sku, :slug, :image, :category_id, :user_id

  mount_uploader :image, ArticleImageUploader

end
# == Schema Information
#
# Table name: articles
#
#  id          :integer(4)      not null, primary key
#  swap_name   :string(255)
#  wish_name   :string(255)
#  price       :float
#  qq          :string(255)
#  phone       :string(255)
#  condition   :string(255)
#  description :text
#  sku         :string(255)
#  code        :string(255)
#  slug        :string(255)
#  view_count  :integer(4)
#  province_id :integer(4)
#  city_id     :integer(4)
#  district_id :integer(4)
#  user_id     :integer(4)
#  category_id :integer(4)
#  publish_at  :datetime
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  image       :string(255)
#

