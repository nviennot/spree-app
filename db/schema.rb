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

ActiveRecord::Schema.define(version: 20140407070919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aspect_memberships", force: true do |t|
    t.integer  "aspect_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aspect_visibilities", force: true do |t|
    t.integer  "aspect_id"
    t.integer  "shareable_id"
    t.string   "shareable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aspects", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.integer  "person_id"
    t.boolean  "sharing"
    t.boolean  "receiving"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "author_id"
    t.boolean  "positive"
    t.integer  "target_id"
    t.string   "target_type"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "guid"
    t.text     "url"
    t.string   "diaspora_handle"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "author_id"
    t.boolean  "public"
    t.string   "diaspora_handle"
    t.text     "remote_photo_path"
    t.string   "remote_photo_name"
    t.string   "guid"
    t.string   "status_message_guid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "author_id"
    t.boolean  "public"
    t.string   "diaspora_handle"
    t.string   "guid"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sentiment"
    t.text     "concepts"
  end

  create_table "share_visibilities", force: true do |t|
    t.integer  "shareable_id"
    t.string   "shareable_type"
    t.integer  "contact_id"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "current_sign_in_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "topics"
  end

end
