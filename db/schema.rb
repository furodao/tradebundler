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

ActiveRecord::Schema.define(version: 20160825144237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "org_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role"
    t.index ["email"], name: "index_buyers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id", "buyer_id"], name: "index_contacts_on_seller_id_and_buyer_id", unique: true, using: :btree
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "seller_org_id"
    t.integer "buyer_org_id"
    t.integer "offer_id"
    t.integer "spec_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "time"
    t.string   "place"
    t.string   "status"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "spec_id"
    t.text     "description"
    t.decimal  "budget"
    t.date     "delivery_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status"
    t.json     "docs"
    t.string   "custom_checks_ids", default: [],              array: true
  end

  create_table "orgs", force: :cascade do |t|
    t.integer  "org_num"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "org_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.index ["email"], name: "index_sellers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "spec_categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "specs", force: :cascade do |t|
    t.integer  "buyer_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "contact_date"
    t.decimal  "budget"
    t.integer  "spec_category_id"
    t.jsonb    "custom_checks",    default: "[]", null: false
    t.datetime "deadline"
    t.date     "delivery_date"
    t.index ["custom_checks"], name: "index_specs_on_custom_checks", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
