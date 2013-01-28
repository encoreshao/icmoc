class CreateUserHobbies < ActiveRecord::Migration
  def change
    create_table :user_hobbies do |t|
      t.string :books
      t.string :music
      t.string :movie
      t.string :sports
      t.string :brand
      t.string :favorite_people
      t.string :hobby
      t.references :user

      t.timestamps
    end

    add_index :user_hobbies, :user_id
  end
end
