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

ActiveRecord::Schema.define(version: 2019_06_28_123953) do

  create_table "date_purchases", force: :cascade do |t|
    t.integer "total_cost", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "expense", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_purchases_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["store_purchases_id"], name: "index_products_on_store_purchases_id"
  end

  create_table "store_purchases", force: :cascade do |t|
    t.integer "date_purchase_id", null: false
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_purchase_id"], name: "index_store_purchases_on_date_purchase_id"
    t.index ["store_id"], name: "index_store_purchases_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
