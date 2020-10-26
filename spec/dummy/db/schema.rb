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

ActiveRecord::Schema.define(version: 2020_10_18_043517) do

  create_table "paxful_engine_trades", force: :cascade do |t|
    t.string "trade_hash", null: false
    t.string "offer_hash", null: false
    t.string "offer_type", null: false
    t.decimal "fiat_amount_requested", null: false
    t.string "fiat_currency_code", null: false
    t.decimal "crypto_amount_requested", null: false
    t.string "crypto_currency_code", null: false
    t.datetime "started_at", null: false
    t.datetime "ended_at", null: false
    t.datetime "completed_at"
    t.string "seller", null: false
    t.string "buyer", null: false
    t.string "status", null: false
    t.string "payment_method_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_hash"], name: "index_paxful_engine_trades_on_trade_hash", unique: true
  end

end
