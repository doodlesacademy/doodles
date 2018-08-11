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

ActiveRecord::Schema.define(version: 20180811212316) do

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

  create_table "collections", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections_project_sets", force: :cascade do |t|
    t.integer "collection_id",  null: false
    t.integer "project_set_id", null: false
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

  create_table "favorite_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "video_uri"
    t.string   "slug"
    t.string   "inspiration_image"
    t.text     "inspiration_image_description"
    t.integer  "status",                          default: 0
    t.string   "inspiration_image_file_name"
    t.string   "inspiration_image_content_type"
    t.integer  "inspiration_image_file_size"
    t.datetime "inspiration_image_updated_at"
    t.string   "overview_file_name"
    t.string   "overview_content_type"
    t.integer  "overview_file_size"
    t.datetime "overview_updated_at"
    t.integer  "order",                           default: 1
    t.string   "example_image_file_name"
    t.string   "example_image_content_type"
    t.integer  "example_image_file_size"
    t.datetime "example_image_updated_at"
    t.string   "inspiration_image_title"
    t.string   "objective"
    t.string   "materials"
    t.text     "media"
    t.text     "setting_up"
    t.text     "worktime_focus"
    t.text     "synopsis"
    t.text     "anticipated_problems"
    t.text     "early_finishers"
    t.text     "worktime"
    t.text     "pre_work"
    t.text     "additional_worktime"
    t.text     "pre_work_heading"
    t.text     "clean_up"
    t.string   "first_photocopy_file_name"
    t.string   "first_photocopy_content_type"
    t.integer  "first_photocopy_file_size"
    t.datetime "first_photocopy_updated_at"
    t.string   "second_photocopy_file_name"
    t.string   "second_photocopy_content_type"
    t.integer  "second_photocopy_file_size"
    t.datetime "second_photocopy_updated_at"
    t.string   "third_photocopy_file_name"
    t.string   "third_photocopy_content_type"
    t.integer  "third_photocopy_file_size"
    t.datetime "third_photocopy_updated_at"
    t.text     "first_photocopy_header"
    t.text     "second_photocopy_header"
    t.text     "third_photocopy_header"
    t.text     "check_for_understanding"
    t.text     "independent_worktime"
    t.text     "group_worktime"
    t.text     "intro_time"
    t.text     "worktime_time"
    t.text     "instructions"
    t.text     "additional_independent_worktime"
    t.text     "additional_group_worktime"
    t.text     "additional_worktime_time"
    t.text     "additional_worktime_focus"
    t.text     "video_note"
    t.text     "materials_note"
    t.text     "first_photocopy_url"
    t.text     "second_photocopy_url"
    t.text     "vimeo_offline_url"
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

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.string   "sku",         null: false
    t.string   "image_url",   null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "school"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "occupation"
    t.string   "grades"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "project_sets", force: :cascade do |t|
    t.string   "title"
    t.integer  "upper_id"
    t.integer  "lower_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "slug"
    t.string   "inspiration_image"
    t.string   "unit"
    t.integer  "unit_number"
    t.string   "project_image_file_name"
    t.string   "project_image_content_type"
    t.integer  "project_image_file_size"
    t.datetime "project_image_updated_at"
    t.integer  "status",                     default: 0
    t.integer  "unit_id"
  end

  add_index "project_sets", ["lower_id"], name: "index_project_sets_on_lower_id", using: :btree
  add_index "project_sets", ["upper_id"], name: "index_project_sets_on_upper_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "lessons_count"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
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
    t.text     "synopsis"
    t.text     "materials"
    t.text     "books_media"
    t.text     "common_core"
    t.text     "national_core"
    t.text     "art_elements"
    t.text     "art_principles"
    t.text     "cross_curricular"
    t.text     "materials_suggestion"
    t.text     "photocopy"
    t.text     "photocopy_copyright"
    t.string   "first_photocopy_file_name"
    t.string   "first_photocopy_content_type"
    t.integer  "first_photocopy_file_size"
    t.datetime "first_photocopy_updated_at"
    t.string   "second_photocopy_file_name"
    t.string   "second_photocopy_content_type"
    t.integer  "second_photocopy_file_size"
    t.datetime "second_photocopy_updated_at"
    t.string   "third_photocopy_file_name"
    t.string   "third_photocopy_content_type"
    t.integer  "third_photocopy_file_size"
    t.datetime "third_photocopy_updated_at"
    t.text     "first_photocopy_header"
    t.text     "second_photocopy_header"
    t.text     "third_photocopy_header"
    t.text     "featured_artist_name"
    t.text     "featured_artist_image_title"
    t.text     "fourth_photocopy_header"
    t.text     "fifth_photocopy_header"
    t.string   "fourth_photocopy_file_name"
    t.string   "fourth_photocopy_content_type"
    t.integer  "fourth_photocopy_file_size"
    t.datetime "fourth_photocopy_updated_at"
    t.string   "fifth_photocopy_file_name"
    t.string   "fifth_photocopy_content_type"
    t.integer  "fifth_photocopy_file_size"
    t.datetime "fifth_photocopy_updated_at"
    t.integer  "status",                             default: 0
    t.text     "engage_ny"
    t.text     "next_gen_sci"
    t.text     "first_photocopy_url"
    t.text     "second_photocopy_url"
    t.string   "sixth_photocopy_file_name"
    t.string   "sixth_photocopy_content_type"
    t.integer  "sixth_photocopy_file_size"
    t.datetime "sixth_photocopy_updated_at"
    t.text     "sixth_photocopy_header"
    t.text     "teachers_pay_teachers_link"
    t.text     "core_content"
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

  create_table "subscription_sets", force: :cascade do |t|
    t.integer  "subscription_id", null: false
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "subscription_sets", ["subscription_id"], name: "index_subscription_sets_on_subscription_id", using: :btree

  create_table "subscription_sets_projects", force: :cascade do |t|
    t.integer "subscription_set_id"
    t.integer "project_id"
  end

  add_index "subscription_sets_projects", ["project_id"], name: "index_subscription_sets_projects_on_project_id", using: :btree
  add_index "subscription_sets_projects", ["subscription_set_id"], name: "index_subscription_sets_projects_on_subscription_set_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "supply_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "asin"
  end

  create_table "units", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "last_lesson_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
