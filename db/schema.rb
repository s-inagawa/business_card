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

ActiveRecord::Schema.define(version: 20140116160242) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "fax"
    t.string   "tel"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["company_id"], name: "index_groups_on_company_id"

  create_table "name_cards", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "fax"
    t.string   "tel"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "name_cards", ["user_id"], name: "index_name_cards_on_user_id"

  create_table "users", force: true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "mail"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id"

end
