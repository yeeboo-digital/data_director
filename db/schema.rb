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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140426174815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "supporter_rows", force: true do |t|
    t.integer  "supporter_id"
    t.text     "data"
    t.string   "data_type"
    t.string   "data_file"
    t.integer  "data_line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supporter_rows", ["data_type", "data_line"], name: "index_supporter_rows_on_data_type_and_data_line", using: :btree
  add_index "supporter_rows", ["data_type"], name: "index_supporter_rows_on_data_type", using: :btree
  add_index "supporter_rows", ["supporter_id"], name: "index_supporter_rows_on_supporter_id", using: :btree

  create_table "supporters", force: true do |t|
    t.string   "supporter_id"
    t.string   "email"
    t.string   "external_id_fr_crm"
    t.string   "external_id_greenwire"
    t.string   "email_opt_out"
    t.string   "email_ok"
    t.string   "email_type"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "company"
    t.string   "date_of_birth"
    t.string   "year_of_birth"
    t.string   "gender"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "city"
    t.string   "region"
    t.string   "postcode"
    t.string   "country"
    t.string   "language_pref"
    t.string   "contact_codes"
    t.string   "communication_codes"
    t.string   "gp_interests"
    t.string   "source"
    t.text     "legacy_optin_details"
    t.string   "legacy_optin_date"
    t.string   "fr_rg_amount"
    t.string   "fr_rg_frequency"
    t.string   "fr_rg_last_gift_date"
    t.string   "petition_shell"
    t.string   "phone_number"
    t.string   "phone_type"
    t.string   "phone_work"
    t.string   "phone_mobile"
    t.string   "phone_fax"
    t.string   "birth_day"
    t.string   "birth_month"
    t.string   "birth_year"
    t.string   "is_volunteer"
    t.string   "opt_in_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_type"
    t.datetime "optin_date"
    t.integer  "supporter_rows_count",  default: 0
    t.datetime "birthday"
  end

  add_index "supporters", ["birth_day"], name: "index_supporters_on_birth_day", using: :btree
  add_index "supporters", ["birth_month"], name: "index_supporters_on_birth_month", using: :btree
  add_index "supporters", ["birth_year"], name: "index_supporters_on_birth_year", using: :btree
  add_index "supporters", ["city"], name: "index_supporters_on_city", using: :btree
  add_index "supporters", ["country", "email"], name: "index_supporters_on_country_and_email", using: :btree
  add_index "supporters", ["country"], name: "index_supporters_on_country", using: :btree
  add_index "supporters", ["data_type", "country"], name: "index_supporters_on_data_type_and_country", using: :btree
  add_index "supporters", ["data_type", "supporter_rows_count"], name: "index_supporters_on_data_type_and_supporter_rows_count", using: :btree
  add_index "supporters", ["data_type"], name: "index_supporters_on_data_type", using: :btree
  add_index "supporters", ["email"], name: "index_supporters_on_email", using: :btree
  add_index "supporters", ["gender"], name: "index_supporters_on_gender", using: :btree
  add_index "supporters", ["language_pref"], name: "index_supporters_on_language_pref", using: :btree
  add_index "supporters", ["region"], name: "index_supporters_on_region", using: :btree
  add_index "supporters", ["source"], name: "index_supporters_on_source", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
