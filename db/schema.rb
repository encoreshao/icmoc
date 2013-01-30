# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130000910) do

  create_table "articles", :force => true do |t|
    t.string   "swap_name"
    t.string   "wish_name"
    t.string   "code"
    t.float    "price"
    t.string   "qq"
    t.string   "phone"
    t.text     "description"
    t.integer  "view_count"
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "articles", ["city_id"], :name => "index_articles_on_city_id"
  add_index "articles", ["code"], :name => "index_articles_on_code"
  add_index "articles", ["district_id"], :name => "index_articles_on_district_id"
  add_index "articles", ["province_id"], :name => "index_articles_on_province_id"
  add_index "articles", ["swap_name"], :name => "index_articles_on_swap_name"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"
  add_index "articles", ["wish_name"], :name => "index_articles_on_wish_name"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.integer  "level"
    t.string   "zip_code"
    t.string   "name_en"
    t.string   "name_abbr"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cities", ["level"], :name => "index_cities_on_level"
  add_index "cities", ["name"], :name => "index_cities_on_name"
  add_index "cities", ["name_abbr"], :name => "index_cities_on_name_abbr"
  add_index "cities", ["name_en"], :name => "index_cities_on_name_en"
  add_index "cities", ["province_id"], :name => "index_cities_on_province_id"
  add_index "cities", ["zip_code"], :name => "index_cities_on_zip_code"

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.string   "name_en"
    t.string   "name_abbr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "districts", ["city_id"], :name => "index_districts_on_city_id"
  add_index "districts", ["name"], :name => "index_districts_on_name"
  add_index "districts", ["name_abbr"], :name => "index_districts_on_name_abbr"
  add_index "districts", ["name_en"], :name => "index_districts_on_name_en"

  create_table "personalities", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.string   "name_en"
    t.string   "name_abbr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "provinces", ["name"], :name => "index_provinces_on_name"
  add_index "provinces", ["name_abbr"], :name => "index_provinces_on_name_abbr"
  add_index "provinces", ["name_en"], :name => "index_provinces_on_name_en"

  create_table "user_details", :force => true do |t|
    t.integer  "somatotype"
    t.integer  "marriage"
    t.integer  "habit_smoke"
    t.integer  "habit_wine"
    t.integer  "habit_sleep"
    t.string   "character"
    t.integer  "educational_level"
    t.integer  "profession"
    t.string   "contact_information"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "user_details", ["educational_level"], :name => "index_user_details_on_educational_level"
  add_index "user_details", ["marriage"], :name => "index_user_details_on_marriage"
  add_index "user_details", ["somatotype"], :name => "index_user_details_on_somatotype"
  add_index "user_details", ["user_id"], :name => "index_user_details_on_user_id"

  create_table "user_educationals", :force => true do |t|
    t.integer  "school_type"
    t.string   "school_name"
    t.integer  "year_in"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_educationals", ["school_name"], :name => "index_user_educationals_on_school_name"
  add_index "user_educationals", ["school_type"], :name => "index_user_educationals_on_school_type"
  add_index "user_educationals", ["user_id"], :name => "index_user_educationals_on_user_id"

  create_table "user_hobbies", :force => true do |t|
    t.string   "books"
    t.string   "music"
    t.string   "movie"
    t.string   "sports"
    t.string   "brand"
    t.string   "favorite_people"
    t.string   "hobby"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "user_hobbies", ["user_id"], :name => "index_user_hobbies_on_user_id"

  create_table "user_works", :force => true do |t|
    t.string   "unit_name"
    t.integer  "start_year"
    t.integer  "start_month"
    t.integer  "end_year"
    t.integer  "end_month"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_works", ["unit_name"], :name => "index_user_works_on_unit_name"
  add_index "user_works", ["user_id"], :name => "index_user_works_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "is_admin",               :default => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar"
    t.datetime "birthday"
    t.boolean  "gender",                 :default => false
    t.string   "blood"
    t.string   "status"
    t.boolean  "is_hidden",              :default => false
    t.string   "biography"
    t.integer  "birthplace_province_id"
    t.integer  "birthplace_city_id"
    t.integer  "birthplace_district_id"
    t.integer  "residence_province_id"
    t.integer  "residence_city_id"
    t.integer  "residence_district_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["current_sign_in_ip"], :name => "index_users_on_current_sign_in_ip"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_sign_in_ip"], :name => "index_users_on_last_sign_in_ip"
  add_index "users", ["name"], :name => "index_users_on_name"

end
