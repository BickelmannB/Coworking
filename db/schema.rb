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

ActiveRecord::Schema.define(version: 2019_09_24_083802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "statut", default: "unconfirmed"
    t.boolean "contract_accepted", default: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "workplace_id"
    t.date "starting_date"
    t.date "ending_date"
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.index ["workplace_id"], name: "index_reservations_on_workplace_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "already_logged", default: false
    t.integer "address_n"
    t.string "address_street"
    t.integer "address_zip"
    t.string "address"
    t.string "address_city"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workplaces", force: :cascade do |t|
    t.string "name"
    t.integer "total_places"
    t.string "photo", default: "image/upload/v1569313569/tyutt0y5b9yykzxsx9ry.jpg"
    t.string "description"
  end

  add_foreign_key "reservations", "users"
  add_foreign_key "reservations", "workplaces"
end
