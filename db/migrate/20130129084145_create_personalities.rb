class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :personalities do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
