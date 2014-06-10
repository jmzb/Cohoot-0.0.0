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

ActiveRecord::Schema.define(version: 20140523005925) do

  create_table "campaigns", force: true do |t|
    t.text     "content"
    t.datetime "tstmp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id"

  create_table "data_migrations", id: false, force: true do |t|
    t.string "version", null: false
  end

  add_index "data_migrations", ["version"], name: "unique_data_migrations", unique: true

  create_table "follow_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "follow_users", ["state"], name: "index_follow_users_on_state"
  add_index "follow_users", ["user_id", "followed_id"], name: "index_follow_users_on_user_id_and_followed_id"

  create_table "locations", force: true do |t|
    t.string   "loc_name"
    t.string   "loc_street"
    t.string   "loc_city"
    t.string   "loc_state"
    t.integer  "loc_zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "org_id"
    t.integer  "organization_id"
  end

  add_index "locations", ["org_id"], name: "index_locations_on_org_id"
  add_index "locations", ["organization_id"], name: "index_locations_on_organization_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "addressA"
    t.string   "cityA"
    t.string   "stateA"
    t.string   "zipA"
    t.string   "addressB"
    t.string   "cityB"
    t.string   "stateB"
    t.string   "zipB"
    t.string   "website"
    t.string   "phoneA"
    t.string   "phoneB"
    t.string   "fax"
    t.integer  "user_id"
  end

  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id"

  create_table "programs", force: true do |t|
    t.string   "prog_name"
    t.text     "prog_obj"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "programs", ["organization_id"], name: "index_programs_on_organization_id"

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
    t.integer  "organization_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.integer  "volunteer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["organization_id"], name: "index_users_on_organization_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
