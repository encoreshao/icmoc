class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :name_en
      t.integer :level
      t.integer :parent_id
      t.boolean :promotion, default: false
      t.boolean :is_active, default: true
      t.string :code
      t.string :slug

      t.timestamps
    end

    add_index :categories, :name
    add_index :categories, :name_en
    add_index :categories, :parent_id
  end
end
