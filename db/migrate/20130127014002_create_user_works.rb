class CreateUserWorks < ActiveRecord::Migration
  def change
    create_table :user_works do |t|
      t.string :unit_name
      t.integer :start_year
      t.integer :start_month
      t.integer :end_year
      t.integer :end_month
      t.references :user

      t.timestamps
    end

    add_index :user_works, :user_id
    add_index :user_works, :unit_name
  end
end
