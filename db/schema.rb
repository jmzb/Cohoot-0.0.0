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

ActiveRecord::Schema.define(version: 20141223224559) do

  create_table "campaigns", force: true do |t|
    t.text     "content"
    t.datetime "tstmp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id"

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
    t.string   "loc_phone"
    t.string   "loc_fax"
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
    t.string   "website"
    t.string   "main_access"
    t.integer  "user_id"
    t.integer  "program_id"
    t.integer  "location_id"
    t.text     "history"
    t.text     "tagline"
  end

  add_index "organizations", ["history"], name: "index_organizations_on_history"
  add_index "organizations", ["location_id"], name: "index_organizations_on_location_id"
  add_index "organizations", ["program_id"], name: "index_organizations_on_program_id"
  add_index "organizations", ["tagline"], name: "index_organizations_on_tagline"
  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id"

  create_table "program_activities", force: true do |t|
    t.string   "activity_name"
    t.text     "activity_short_desc"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_activities", ["program_id"], name: "index_program_activities_on_program_id"

  create_table "programs", force: true do |t|
    t.string   "prog_name"
    t.text     "prog_obj"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.text     "ideal_candidate"
    t.text     "goal_condition"
    t.string   "next_step"
    t.integer  "org_id"
    t.time     "hrs_mon_s"
    t.time     "hrs_mon_e"
    t.time     "hrs_tues_s"
    t.time     "hrs_tues_e"
    t.time     "hrs_wed_s"
    t.time     "hrs_wed_e"
    t.time     "hrs_thurs_s"
    t.time     "hrs_thurs_e"
    t.time     "hrs_fri_s"
    t.time     "hrs_fri_e"
    t.time     "hrs_sat_s"
    t.time     "hrs_sat_e"
    t.time     "hrs_sun_s"
    t.time     "hrs_sun_e"
    t.text     "candidate_requirements"
    t.string   "prog_cost"
    t.decimal  "prog_hours"
    t.string   "prog_hours_per_units"
    t.text     "length_of_prog"
  end

  add_index "programs", ["candidate_requirements"], name: "index_programs_on_candidate_requirements"
  add_index "programs", ["hrs_fri_e"], name: "index_programs_on_hrs_fri_e"
  add_index "programs", ["hrs_fri_s"], name: "index_programs_on_hrs_fri_s"
  add_index "programs", ["hrs_mon_e"], name: "index_programs_on_hrs_mon_e"
  add_index "programs", ["hrs_mon_s"], name: "index_programs_on_hrs_mon_s"
  add_index "programs", ["hrs_sat_e"], name: "index_programs_on_hrs_sat_e"
  add_index "programs", ["hrs_sat_s"], name: "index_programs_on_hrs_sat_s"
  add_index "programs", ["hrs_sun_e"], name: "index_programs_on_hrs_sun_e"
  add_index "programs", ["hrs_sun_s"], name: "index_programs_on_hrs_sun_s"
  add_index "programs", ["hrs_thurs_e"], name: "index_programs_on_hrs_thurs_e"
  add_index "programs", ["hrs_thurs_s"], name: "index_programs_on_hrs_thurs_s"
  add_index "programs", ["hrs_tues_e"], name: "index_programs_on_hrs_tues_e"
  add_index "programs", ["hrs_tues_s"], name: "index_programs_on_hrs_tues_s"
  add_index "programs", ["hrs_wed_e"], name: "index_programs_on_hrs_wed_e"
  add_index "programs", ["hrs_wed_s"], name: "index_programs_on_hrs_wed_s"
  add_index "programs", ["length_of_prog"], name: "index_programs_on_length_of_prog"
  add_index "programs", ["org_id"], name: "index_programs_on_org_id"
  add_index "programs", ["organization_id"], name: "index_programs_on_organization_id"
  add_index "programs", ["prog_cost"], name: "index_programs_on_prog_cost"
  add_index "programs", ["prog_hours"], name: "index_programs_on_prog_hours"
  add_index "programs", ["prog_hours_per_units"], name: "index_programs_on_prog_hours_per_units"

  create_table "staffs", force: true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "staffs", ["organization_id"], name: "index_staffs_on_organization_id"
  add_index "staffs", ["state"], name: "index_staffs_on_state"
  add_index "staffs", ["user_id"], name: "index_staffs_on_user_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["organization_id"], name: "index_users_on_organization_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
