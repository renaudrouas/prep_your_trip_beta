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

ActiveRecord::Schema.define(version: 2018_07_05_130800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "e_mail"
    t.string "phone_number"
    t.time "start_date"
    t.time "end_date"
    t.float "latitude"
    t.float "longitude"
    t.string "reservation_number"
    t.integer "kind", default: 0
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.text "description"
    t.boolean "done", default: false
    t.string "title"
    t.time "completed_at"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", force: :cascade do |t|
    t.string "reservation_number"
    t.string "compagny_name"
    t.time "start_date"
    t.time "end_date"
    t.string "address_in"
    t.string "address_out"
    t.float "latin"
    t.float "latout"
    t.float "lngin"
    t.float "lngout"
    t.integer "mode"
    t.string "ticket_file"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_travels_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.string "destination"
    t.float "latitude"
    t.float "longitude"
    t.time "start_date"
    t.time "end_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "travels", "trips"
  add_foreign_key "trips", "users"
end
