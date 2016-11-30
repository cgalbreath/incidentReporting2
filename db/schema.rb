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

ActiveRecord::Schema.define(version: 20161119225506) do

  create_table "areas", force: :cascade do |t|
    t.integer  "facilities_id", limit: 4
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "areas", ["facilities_id"], name: "index_areas_on_facilities_id", using: :btree

  create_table "behaviourals", force: :cascade do |t|
    t.integer  "incident_id",                   limit: 4
    t.integer  "behav_involved_type_id",        limit: 4
    t.string   "behav_involved_name",           limit: 255
    t.text     "behav_description",             limit: 65535
    t.text     "behav_counseling",              limit: 65535
    t.text     "behav_followup",                limit: 65535
    t.boolean  "behav_members_involved"
    t.boolean  "behav_staff_involved"
    t.boolean  "behav_other_involved"
    t.text     "behav_members_involved_detail", limit: 65535
    t.text     "behav_staff_involved_detail",   limit: 65535
    t.text     "behav_other_involved_detail",   limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "facility_areas", force: :cascade do |t|
    t.integer  "facility_id", limit: 4
    t.integer  "area_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "facility_programs", force: :cascade do |t|
    t.integer  "facility_id", limit: 4
    t.integer  "program_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "incident_types", force: :cascade do |t|
    t.string "name",        limit: 255
    t.string "description", limit: 255
  end

  create_table "incidents", force: :cascade do |t|
    t.string  "date_reported",      limit: 255
    t.string  "date_of_incident",   limit: 255
    t.string  "reporter",           limit: 255
    t.string  "reporter_atc",       limit: 255
    t.string  "witness",            limit: 255
    t.string  "witness_atc",        limit: 255
    t.text    "description",        limit: 65535
    t.string  "physical_address",   limit: 255
    t.integer "severity_level_id",  limit: 4
    t.integer "location_id",        limit: 4
    t.integer "program_id",         limit: 4
    t.integer "facility_id",        limit: 4
    t.integer "area_id",            limit: 4
    t.boolean "emergency_notified"
    t.string  "emergency_detail",   limit: 255
    t.boolean "insurance_filed"
    t.string  "insurance_detail",   limit: 255
  end

  create_table "injuries", force: :cascade do |t|
    t.integer  "incident_id",              limit: 4
    t.integer  "injury_involved_type_id",  limit: 4
    t.integer  "injury_count_id",          limit: 4
    t.string   "injury_involved_name",     limit: 255
    t.string   "injury_description",       limit: 255
    t.string   "injury_first_aid",         limit: 255
    t.text     "injury_followup",          limit: 65535
    t.boolean  "injury_guardian_notified"
    t.string   "injury_guardian_name",     limit: 255
    t.string   "injury_guardian_number",   limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
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

  create_table "misconducts", force: :cascade do |t|
    t.integer  "incident_id",                        limit: 4
    t.text     "misconduct_description",             limit: 65535
    t.boolean  "misconduct_cps_notified"
    t.boolean  "misconduct_emergency_notified"
    t.text     "misconduct_cps_detail",              limit: 65535
    t.text     "misconduct_emergency_detail",        limit: 65535
    t.text     "misconduct_followup",                limit: 65535
    t.boolean  "misconduct_members_involved"
    t.boolean  "misconduct_staff_involved"
    t.boolean  "misconduct_other_involved"
    t.text     "misconduct_members_involved_detail", limit: 65535
    t.text     "misconduct_staff_involved_detail",   limit: 65535
    t.text     "misconduct_other_involved_detail",   limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "property_damages", force: :cascade do |t|
    t.integer  "incident_id",                  limit: 4
    t.text     "prop_description",             limit: 65535
    t.text     "prop_occurance",               limit: 65535
    t.boolean  "prop_emergency_notified"
    t.boolean  "prop_insurance_filed"
    t.boolean  "prop_members_involved"
    t.text     "prop_emergency_detail",        limit: 65535
    t.text     "prop_insurance_filed_detail",  limit: 65535
    t.text     "prop_members_involved_detail", limit: 65535
    t.text     "prop_followup",                limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "severity_levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "thefts", force: :cascade do |t|
    t.integer  "incident_id",          limit: 4
    t.text     "theft_serial",         limit: 65535
    t.text     "theft_description",    limit: 65535
    t.boolean  "theft_security_video"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
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
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "facility_id",            limit: 255
    t.string   "program_id",             limit: 255
    t.string   "username",               limit: 255
    t.boolean  "admin"
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_accidents", force: :cascade do |t|
    t.integer  "incident_id",                      limit: 4
    t.integer  "veh_ownership_id",                 limit: 4
    t.text     "veh_description",                  limit: 65535
    t.text     "veh_car_description",              limit: 65535
    t.boolean  "veh_members_involved"
    t.boolean  "veh_alternative_transport"
    t.boolean  "veh_insurance_filed"
    t.boolean  "veh_drug_screen"
    t.boolean  "veh_emergency_notified"
    t.text     "veh_members_involved_detail",      limit: 65535
    t.text     "veh_alternative_transport_detail", limit: 65535
    t.text     "veh_insurance_filed_detail",       limit: 65535
    t.text     "veh_emergency_detail",             limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "vehicle_ownerships", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
