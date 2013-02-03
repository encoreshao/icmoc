class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :swap_name
      t.string  :wish_name
      t.float   :price
      t.string  :qq
      t.string  :phone
      t.string  :condition
      t.text    :description
      t.string  :sku
      t.string  :code
      t.string  :slug
      t.integer :view_count
      t.references :province
      t.references :city
      t.references :district
      t.references :user
      t.references :category

      t.datetime  :publish_at

      t.timestamps
    end

    add_index :articles, :swap_name
    add_index :articles, :wish_name
    add_index :articles, :code
    add_index :articles, :sku
    add_index :articles, :publish_at
    add_index :articles, :province_id
    add_index :articles, :city_id
    add_index :articles, :district_id
    add_index :articles, :user_id
    add_index :articles, :category_id
  end
end
