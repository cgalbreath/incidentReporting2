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

ActiveRecord::Schema.define(version: 0) do

  create_table "incidents", force: :cascade do |t|
    t.string "incident_type"
    t.string "date_of_incident"
    t.string "time_of_incident"
    t.string "reporter"
    t.string "witness"
    t.string "location"
    t.string "address"
    t.string "description"
    t.string "loc_area"
    t.string "first_aid"
    t.string "guardian_notified"
    t.string "emergency_notified"
    t.string "parent_pickup"
  end

  create_table "persons", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "sex"
    t.string "address"
  end

end
