class AddPromoteToProvinceAndCityDistrict < ActiveRecord::Migration
  def change
    add_column :provinces, :promote, :boolean, default: false
    add_column :cities, :promote, :boolean, default: false
    add_column :districts, :promote, :boolean, default: false
  end
end
