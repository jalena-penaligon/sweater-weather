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

ActiveRecord::Schema.define(version: 2019_06_02_221505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "current_temperatures", force: :cascade do |t|
    t.float "temperature"
    t.string "summary"
    t.string "icon"
    t.float "feels_like"
    t.float "humidity"
    t.float "visibility"
    t.integer "uvindex"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "high_temp"
    t.float "low_temp"
    t.string "full_summary"
    t.index ["location_id"], name: "index_current_temperatures_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city_state"
    t.string "lat"
    t.string "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  add_foreign_key "current_temperatures", "locations"
end
