class CreateUserWorks < ActiveRecord::Migration
  def change
    create_table :user_works do |t|
      t.string :unit_name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :indexing
      t.references :user

      t.timestamps
    end

    add_index :user_works, :user_id
  end
end
