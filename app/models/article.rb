class Article < ActiveRecord::Base
  attr_accessible :city_id, :code, :description, :district_id, :phone, :price, :province_id, :qq, :swap_name, :view_count, :wish_name
end
