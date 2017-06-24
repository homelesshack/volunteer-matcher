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

ActiveRecord::Schema.define(version: 20170624114230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
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
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "charities", force: :cascade do |t|
    t.string "name", null: false
    t.string "postcode", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false, null: false
    t.index ["postcode"], name: "index_charities_on_postcode"
  end

  create_table "needs", force: :cascade do |t|
    t.string "skill", null: false
    t.decimal "time_amount", null: false
    t.bigint "charity_id", null: false
    t.string "days", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_id"], name: "index_needs_on_charity_id"
    t.index ["days"], name: "index_needs_on_days", using: :gin
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "hours_per_week", null: false
    t.string "days_available", default: [], null: false, array: true
    t.string "skills", default: [], null: false, array: true
    t.string "postcode", null: false
    t.decimal "miles_from", default: "5.0", null: false
    t.boolean "dbs_checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["days_available"], name: "index_volunteers_on_days_available", using: :gin
    t.index ["postcode"], name: "index_volunteers_on_postcode"
    t.index ["skills"], name: "index_volunteers_on_skills", using: :gin
  end

  add_foreign_key "needs", "charities"
end
