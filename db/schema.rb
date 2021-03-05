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

ActiveRecord::Schema.define(version: 2021_03_05_161648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.integer "number"
    t.string "date"
    t.string "time"
    t.string "departure_city"
    t.string "arrival_city"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "passenger_id"
    t.bigint "flight_id"
    t.index ["flight_id"], name: "index_tickets_on_flight_id"
    t.index ["passenger_id"], name: "index_tickets_on_passenger_id"
  end

  add_foreign_key "tickets", "flights"
  add_foreign_key "tickets", "passengers"
end
