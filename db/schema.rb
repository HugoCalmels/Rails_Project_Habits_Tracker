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

ActiveRecord::Schema.define(version: 2021_12_31_174429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bad_habits", force: :cascade do |t|
    t.string "title"
    t.integer "announced_checkpoints"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "cycle_id"
    t.index ["cycle_id"], name: "index_bad_habits_on_cycle_id"
    t.index ["user_id"], name: "index_bad_habits_on_user_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.date "date_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "good_habit_id"
    t.index ["good_habit_id"], name: "index_calendars_on_good_habit_id"
  end

  create_table "checkpoints", force: :cascade do |t|
    t.bigint "good_habit_id"
    t.bigint "bad_habit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "checked"
    t.index ["bad_habit_id"], name: "index_checkpoints_on_bad_habit_id"
    t.index ["good_habit_id"], name: "index_checkpoints_on_good_habit_id"
  end

  create_table "cycles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "good_habits", force: :cascade do |t|
    t.string "title"
    t.integer "announced_checkpoints"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "cycle_id"
    t.integer "successed_checkpoints"
    t.index ["cycle_id"], name: "index_good_habits_on_cycle_id"
    t.index ["user_id"], name: "index_good_habits_on_user_id"
  end

  create_table "stats", force: :cascade do |t|
    t.date "date"
    t.integer "cycle_result_success"
    t.integer "cycle_result_failed"
    t.integer "total_result_success"
    t.integer "total_result_failed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "good_habit_id"
    t.bigint "bad_habit_id"
    t.bigint "calendar_id"
    t.index ["bad_habit_id"], name: "index_stats_on_bad_habit_id"
    t.index ["calendar_id"], name: "index_stats_on_calendar_id"
    t.index ["good_habit_id"], name: "index_stats_on_good_habit_id"
  end

  create_table "successes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "state"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  add_foreign_key "bad_habits", "cycles"
  add_foreign_key "bad_habits", "users"
  add_foreign_key "calendars", "good_habits"
  add_foreign_key "checkpoints", "bad_habits"
  add_foreign_key "checkpoints", "good_habits"
  add_foreign_key "good_habits", "cycles"
  add_foreign_key "good_habits", "users"
  add_foreign_key "stats", "bad_habits"
  add_foreign_key "stats", "calendars"
  add_foreign_key "stats", "good_habits"
end
