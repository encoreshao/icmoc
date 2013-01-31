class CreateUserEducationals < ActiveRecord::Migration
  def change
    create_table :user_educationals do |t|
      t.integer :school_type
      t.integer :indexing
      t.string :school_name
      t.datetime :year_in
      t.references :user

      t.timestamps
    end

    add_index :user_educationals, :school_type
    add_index :user_educationals, :indexing
    add_index :user_educationals, [:school_type, :indexing]
    add_index :user_educationals, :school_name
    add_index :user_educationals, :year_in
    add_index :user_educationals, :user_id
  end
end
