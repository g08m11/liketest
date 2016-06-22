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

ActiveRecord::Schema.define(version: 20160622034950) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "country"
    t.string   "postal_code"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "announce"
    t.integer  "likes_count", default: 0
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "invoices", force: :cascade do |t|
    t.string   "number"
    t.date     "start"
    t.date     "end"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "sent"
    t.date     "received"
    t.float    "discount"
  end

  add_index "invoices", ["account_id"], name: "index_invoices_on_account_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["account_id"], name: "index_likes_on_account_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "materialfiles", force: :cascade do |t|
    t.string   "file"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "materialfiles", ["task_id"], name: "index_materialfiles_on_task_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["task_id"], name: "index_messages_on_task_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "outputfiles", force: :cascade do |t|
    t.string   "file"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "outputfiles", ["task_id"], name: "index_outputfiles_on_task_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "jobtype"
    t.string   "title"
    t.string   "department"
    t.date     "due"
    t.text     "requirement"
    t.date     "scheduled"
    t.integer  "progress",      default: 0
    t.float    "timespent",     default: 0.0
    t.date     "completed"
    t.text     "outputcomment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "account_id"
    t.integer  "invoice_id"
    t.string   "note"
  end

  add_index "tasks", ["account_id"], name: "index_tasks_on_account_id"
  add_index "tasks", ["invoice_id"], name: "index_tasks_on_invoice_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.integer  "account_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
    t.string   "picture"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id"

  create_table "viewed_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "viewed_messages", ["message_id"], name: "index_viewed_messages_on_message_id"
  add_index "viewed_messages", ["user_id", "message_id"], name: "index_viewed_messages_on_user_id_and_message_id", unique: true
  add_index "viewed_messages", ["user_id"], name: "index_viewed_messages_on_user_id"

end
