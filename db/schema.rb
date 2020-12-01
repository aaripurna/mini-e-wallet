# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_004434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balance_bank_histories", force: :cascade do |t|
    t.bigint "balance_bank_id"
    t.integer "balance_before"
    t.integer "balance_after"
    t.string "activity"
    t.integer "transaction_type"
    t.string "ip"
    t.string "location"
    t.string "user_agent"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["balance_bank_id"], name: "index_balance_bank_histories_on_balance_bank_id"
  end

  create_table "balance_banks", force: :cascade do |t|
    t.integer "balance"
    t.integer "balance_achive"
    t.string "code"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blacklisted_tokens", force: :cascade do |t|
    t.text "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_balance_histories", force: :cascade do |t|
    t.bigint "user_balance_id"
    t.integer "balance_before"
    t.integer "balance_after"
    t.string "activity"
    t.integer "transaction_type"
    t.string "ip"
    t.string "location"
    t.string "user_agent"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_balance_id"], name: "index_user_balance_histories_on_user_balance_id"
  end

  create_table "user_balances", force: :cascade do |t|
    t.integer "balance"
    t.integer "balance_achive"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_balances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.text "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

end
