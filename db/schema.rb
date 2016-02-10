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

ActiveRecord::Schema.define(version: 20160210011907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedback_messages", force: :cascade do |t|
    t.text     "body"
    t.string   "sender"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feedback_messages", ["lesson_id"], name: "index_feedback_messages_on_lesson_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "video_uri"
    t.text     "objective"
    t.text     "set_up"
  end

  add_index "lessons", ["project_id"], name: "index_lessons_on_project_id", using: :btree

  create_table "lessons_supply_items", id: false, force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "supply_item_id"
  end

  add_index "lessons_supply_items", ["lesson_id"], name: "index_lessons_supply_items_on_lesson_id", using: :btree
  add_index "lessons_supply_items", ["supply_item_id"], name: "index_lessons_supply_items_on_supply_item_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_sets", force: :cascade do |t|
    t.string   "title"
    t.integer  "upper_id"
    t.integer  "lower_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "slug"
    t.string   "description"
    t.string   "books_media"
    t.string   "skills_description"
  end

  add_index "project_sets", ["lower_id"], name: "index_project_sets_on_lower_id", using: :btree
  add_index "project_sets", ["upper_id"], name: "index_project_sets_on_upper_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "lessons_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "project_set_id"
    t.integer  "level"
  end

  create_table "supply_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
