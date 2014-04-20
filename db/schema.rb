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

ActiveRecord::Schema.define(version: 20140420135829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dances", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dances_organisations", id: false, force: true do |t|
    t.integer "dance_id",        null: false
    t.integer "organisation_id", null: false
  end

  create_table "events", force: true do |t|
    t.integer  "organisation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "start_date"
  end

  add_index "events", ["organisation_id"], name: "index_events_on_organisation_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations_organisations", id: false, force: true do |t|
    t.integer "location_id",     null: false
    t.integer "organisation_id", null: false
  end

  create_table "organisations", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weekly_recurrences", force: true do |t|
    t.integer  "event_id"
    t.integer  "day_of_week"
    t.integer  "frequency"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weekly_recurrences", ["event_id"], name: "index_weekly_recurrences_on_event_id", using: :btree

end
