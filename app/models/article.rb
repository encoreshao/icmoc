class Article < ActiveRecord::Base
  attr_accessible :city_id, :code, :description, :district_id, :phone, :price, :province_id, :qq, :swap_name, :view_count, :wish_name
end
# == Schema Information
#
# Table name: articles
#
#  id          :integer(4)      not null, primary key
#  swap_name   :string(255)
#  wish_name   :string(255)
#  code        :string(255)
#  price       :float
#  qq          :string(255)
#  phone       :string(255)
#  description :text
#  view_count  :integer(4)
#  province_id :integer(4)
#  city_id     :integer(4)
#  district_id :integer(4)
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

