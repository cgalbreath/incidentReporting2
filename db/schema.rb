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

ActiveRecord::Schema.define(version: 20161104143908) do

  create_table "areas", force: :cascade do |t|
    t.integer  "facilities_id", limit: 4
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "areas", ["facilities_id"], name: "index_areas_on_facilities_id", using: :btree

  create_table "buses", force: :cascade do |t|
    t.string   "BUS_NUM",             limit: 255
    t.string   "FOUR_VIN",            limit: 255
    t.string   "PLATE",               limit: 255
    t.string   "assigned_programs",   limit: 255
    t.string   "assigned_facilities", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "areas",      limit: 255
    t.string   "programs",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "incident_details", force: :cascade do |t|
    t.integer "incident_id",                  limit: 4
    t.integer "incident_type_id",             limit: 4
    t.integer "involved_type_id",             limit: 4
    t.integer "vehicle_ownership_id",         limit: 4
    t.string  "involved_name",                limit: 255
    t.string  "involved_atc",                 limit: 255
    t.boolean "alternative_transport"
    t.string  "alternative_transport_detail", limit: 255
    t.string  "counseling",                   limit: 255
    t.boolean "cps_notified"
    t.string  "cps_detail",                   limit: 255
    t.text    "description",                  limit: 65535
    t.boolean "drug_screen"
    t.boolean "emergency_notified"
    t.text    "emergency_detail",             limit: 65535
    t.string  "first_aid",                    limit: 255
    t.text    "followup",                     limit: 65535
    t.string  "guardian_name",                limit: 255
    t.string  "guardian_number",              limit: 255
    t.boolean "guardian_notified"
    t.string  "guardian_notified_date",       limit: 255
    t.boolean "insurance_filed"
    t.string  "insurance_filed_detail",       limit: 255
    t.boolean "members_involved"
    t.text    "members_involved_detail",      limit: 65535
    t.text    "occurance",                    limit: 65535
    t.boolean "security_video"
    t.boolean "staff_involved"
    t.text    "staff_involved_detail",        limit: 65535
    t.boolean "other_involved"
    t.text    "other_involved_detail",        limit: 65535
    t.boolean "parent_pickup"
    t.boolean "suspended"
    t.string  "vehicle_ownership",            limit: 255
    t.string  "vehicle_description",          limit: 255
    t.string  "VIN",                          limit: 255
  end

  create_table "incident_types", force: :cascade do |t|
    t.string "name",        limit: 255
    t.string "description", limit: 255
  end

  create_table "incidents", force: :cascade do |t|
    t.string  "date_reported",     limit: 255
    t.string  "date_of_incident",  limit: 255
    t.string  "reporter",          limit: 255
    t.string  "reporter_atc",      limit: 255
    t.string  "witness",           limit: 255
    t.string  "witness_atc",       limit: 255
    t.text    "description",       limit: 65535
    t.string  "physical_address",  limit: 255
    t.integer "severity_level_id", limit: 4
    t.integer "location_id",       limit: 4
    t.integer "program_id",        limit: 4
    t.integer "facility_id",       limit: 4
    t.integer "area_id",           limit: 4
  end

  create_table "involved_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "severity_levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "phone",                  limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "facility_id",            limit: 255
    t.string   "program_id",             limit: 255
    t.string   "username",               limit: 255
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_ownerships", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
