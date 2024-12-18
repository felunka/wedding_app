# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_08_165415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "registration_entries", force: :cascade do |t|
    t.bigint "registration_id", null: false
    t.string "name", null: false
    t.integer "food_selection", default: 0, null: false
    t.string "comment"
    t.boolean "all_days", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_id"], name: "index_registration_entries_on_registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hotel_email"
    t.date "hotel_start_date", default: "2025-06-06"
    t.date "hotel_end_date", default: "2025-06-08"
    t.integer "hotel_number_double_rooms", default: 0
    t.integer "hotel_number_single_rooms", default: 0
    t.integer "hotel_number_of_adults", default: 0
    t.integer "hotel_number_of_children", default: 0
    t.string "hotel_comments"
  end

  add_foreign_key "registration_entries", "registrations"
end
