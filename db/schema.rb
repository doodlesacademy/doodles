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

ActiveRecord::Schema.define(version: 20160522191734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assetables", force: :cascade do |t|
    t.integer  "asset_id"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "assetables", ["assetable_type", "assetable_id"], name: "index_assetables_on_assetable_type_and_assetable_id", using: :btree

  create_table "assets", force: :cascade do |t|
    t.string   "fingerprint", null: false
    t.string   "name"
    t.string   "url"
    t.string   "extension"
    t.integer  "size"
    t.integer  "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contact_requests", force: :cascade do |t|
    t.string   "email_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "involvement"
    t.text     "message"
    t.boolean  "subscribe",     default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "donors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "lifetime_donation"
  end

  create_table "feedback_messages", force: :cascade do |t|
    t.text     "body"
    t.string   "sender"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feedback_messages", ["lesson_id"], name: "index_feedback_messages_on_lesson_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "video_uri"
    t.string   "slug"
    t.string   "inspiration_image"
    t.text     "inspiration_image_description"
    t.integer  "status",                         default: 0
    t.string   "inspiration_image_file_name"
    t.string   "inspiration_image_content_type"
    t.integer  "inspiration_image_file_size"
    t.datetime "inspiration_image_updated_at"
    t.string   "overview_file_name"
    t.string   "overview_content_type"
    t.integer  "overview_file_size"
    t.datetime "overview_updated_at"
    t.integer  "order",                          default: 1
    t.string   "example_image_file_name"
    t.string   "example_image_content_type"
    t.integer  "example_image_file_size"
    t.datetime "example_image_updated_at"
    t.string   "inspiration_image_title"
    t.string   "lesson_description"
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
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "position"
    t.integer  "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "baby_picture_file_name"
    t.string   "baby_picture_content_type"
    t.integer  "baby_picture_file_size"
    t.datetime "baby_picture_updated_at"
    t.string   "linked_in_profile"
  end

  create_table "pages", force: :cascade do |t|
    t.text     "content"
    t.string   "slug"
    t.integer  "status"
    t.string   "title"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "lead"
    t.text     "hero_content"
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
  end

  create_table "project_sets", force: :cascade do |t|
    t.string   "title"
    t.integer  "upper_id"
    t.integer  "lower_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "slug"
    t.string   "inspiration_image"
    t.string   "unit"
    t.integer  "unit_number"
    t.string   "project_image_file_name"
    t.string   "project_image_content_type"
    t.integer  "project_image_file_size"
    t.datetime "project_image_updated_at"
  end

  add_index "project_sets", ["lower_id"], name: "index_project_sets_on_lower_id", using: :btree
  add_index "project_sets", ["upper_id"], name: "index_project_sets_on_upper_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "lessons_count"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "project_set_id"
    t.integer  "level"
    t.string   "inspiration_image_file_name"
    t.string   "inspiration_image_content_type"
    t.integer  "inspiration_image_file_size"
    t.datetime "inspiration_image_updated_at"
    t.string   "overview_file_name"
    t.string   "overview_content_type"
    t.integer  "overview_file_size"
    t.datetime "overview_updated_at"
    t.string   "inspiration_image_description"
    t.text     "featured_artist_description"
    t.string   "featured_artist_image_file_name"
    t.string   "featured_artist_image_content_type"
    t.integer  "featured_artist_image_file_size"
    t.datetime "featured_artist_image_updated_at"
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "sectionable_id"
    t.string   "sectionable_type"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "status"
    t.integer  "order",            default: 0
  end

  create_table "supply_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "asin"
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
    t.integer  "status",                 default: 0
    t.integer  "role",                   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
