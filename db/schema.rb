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

ActiveRecord::Schema.define(version: 2021_04_03_031302) do

  create_table "requests", force: :cascade do |t|
    t.float "number_of_hours"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_approved", default: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "department"
    t.integer "paid_time_off"
    t.integer "salary"
    t.integer "experience"
    t.integer "manager_id"
    t.boolean "is_admin", default: false
    t.string "username"
    t.string "password_digest"
    t.index ["manager_id"], name: "index_users_on_manager_id"
  end

  add_foreign_key "requests", "users"
  add_foreign_key "users", "users", column: "manager_id"
end
