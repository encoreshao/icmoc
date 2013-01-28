class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.boolean   :is_admin, default: false
      t.datetime  :remember_created_at
      t.integer   :sign_in_count, default: 0
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.string    :current_sign_in_ip
      t.string    :last_sign_in_ip

      t.string    :avatar
      t.datetime  :birthday
      t.boolean   :gender, default: false
      t.string    :blood
      t.string    :status
      t.boolean   :is_hidden, default: false
      t.string    :biography
      # birthplace information
      t.integer   :birthplace_province_id
      t.integer   :birthplace_city_id
      t.integer   :birthplace_district_id
      # residence information
      t.integer   :residence_province_id
      t.integer   :residence_city_id
      t.integer   :residence_district_id

      t.timestamps
    end

    add_index :users, :name
    add_index :users, :email
    add_index :users, :last_sign_in_ip
    add_index :users, :current_sign_in_ip
  end
end
