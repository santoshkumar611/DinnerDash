# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151229132927) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "item_orders", force: :cascade do |t|
    t.float    "quantity",   limit: 24
    t.float    "price",      limit: 24
    t.integer  "item_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "item_orders", ["item_id"], name: "index_item_orders_on_item_id", using: :btree
  add_index "item_orders", ["order_id"], name: "index_item_orders_on_order_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.float    "price",        limit: 24
    t.string   "image",        limit: 255
    t.integer  "category_id",  limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_available",               default: true
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree

  create_table "missed_orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "missed_orders", ["user_id"], name: "index_missed_orders_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "status_id",       limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "total_cost",      limit: 24
    t.string   "missed_order_id", limit: 255
    t.boolean  "is_missed",                   default: false
  end

  add_index "orders", ["status_id"], name: "index_orders_on_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name",          limit: 255
    t.string   "email",                 limit: 255
    t.string   "password",              limit: 255
    t.string   "full_name",             limit: 255
    t.string   "image",                 limit: 255
    t.boolean  "is_admin",                          default: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "password_digest",       limit: 255
    t.boolean  "set",                               default: true
    t.string   "braintree_customer_id", limit: 255
  end

  create_table "wish_items", force: :cascade do |t|
    t.integer  "item_id",      limit: 4
    t.integer  "wish_list_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wish_items", ["item_id"], name: "index_wish_items_on_item_id", using: :btree
  add_index "wish_items", ["wish_list_id"], name: "index_wish_items_on_wish_list_id", using: :btree

  create_table "wish_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_orders", "items"
  add_foreign_key "item_orders", "orders"
  add_foreign_key "items", "categories"
  add_foreign_key "missed_orders", "users"
  add_foreign_key "orders", "statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "wish_items", "items"
  add_foreign_key "wish_items", "wish_lists"
end
