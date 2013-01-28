class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :swap_name
      t.string :code
      t.integer :province_id
      t.integer :city_id
      t.integer :district_id
      t.float :price
      t.text :description
      t.string :qq
      t.string :phone
      t.integer :view_count
      t.string :wish_name

      t.timestamps
    end

    add_index :articles, :swap_name
    add_index :articles, :wish_name
    add_index :articles, :province_id
    add_index :articles, :city_id
    add_index :articles, :district_id
    add_index :articles, :code
  end
end
