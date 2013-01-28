class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :somatotype
      t.string :marriage
      t.string :habit_smoke
      t.string :habit_wine
      t.string :habit_sleep
      t.string :character
      t.string :educational_level
      t.string :profession
      t.string :contact_information
      t.references :user

      t.timestamps
    end

    add_index :user_details, :user_id
    add_index :user_details, :somatotype
    add_index :user_details, :marriage
    add_index :user_details, :educational_level
  end
end
