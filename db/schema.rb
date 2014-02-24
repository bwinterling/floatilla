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

ActiveRecord::Schema.define(version: 20140224042243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gauges", force: true do |t|
    t.string   "name"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "long",       precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gauges", ["lat"], name: "index_gauges_on_lat", using: :btree
  add_index "gauges", ["long"], name: "index_gauges_on_long", using: :btree

  create_table "rivers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "rivers", ["state"], name: "index_rivers_on_state", using: :btree

  create_table "runs", force: true do |t|
    t.integer  "river_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section"
  end

  add_index "runs", ["river_id"], name: "index_runs_on_river_id", using: :btree

end
