class CreateUserEducationals < ActiveRecord::Migration
  def change
    create_table :user_educationals do |t|
      t.string :school_type
      t.string :school_name
      t.integer :year_in
      t.references :user

      t.timestamps
    end

    add_index :user_educationals, :school_type
    add_index :user_educationals, :school_name
    add_index :user_educationals, :user_id
  end
end
