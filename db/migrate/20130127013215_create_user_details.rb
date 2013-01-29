class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :somatotype
      t.integer :marriage
      t.integer :habit_smoke
      t.integer :habit_wine
      t.integer :habit_sleep
      t.string :character
      t.integer :educational_level
      t.integer :profession
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
