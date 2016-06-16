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

ActiveRecord::Schema.define(version: 20160616004858) do

  create_table "businesses", force: :cascade do |t|
    t.integer  "device_id",        limit: 4
    t.string   "business_code",    limit: 255
    t.integer  "display_sec",      limit: 4
    t.integer  "dispay_order",     limit: 4
    t.string   "call_message",     limit: 255
    t.integer  "call_display_sec", limit: 4
    t.integer  "lock_version",     limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "code",         limit: 255
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "content_details", force: :cascade do |t|
    t.integer  "content_id",               limit: 4
    t.string   "name",                     limit: 255
    t.integer  "message_type",             limit: 4
    t.integer  "dispay_order",             limit: 4
    t.string   "font_color",               limit: 255
    t.integer  "font_size",                limit: 4
    t.integer  "font_horizontal_position", limit: 4
    t.integer  "lock_version",             limit: 4,   default: 0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "content_tags", force: :cascade do |t|
    t.integer  "content_id",     limit: 4
    t.integer  "tag_id",         limit: 4
    t.string   "search_keyword", limit: 255
    t.integer  "display_order",  limit: 4
    t.integer  "lock_version",   limit: 4,   default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "type",                limit: 255
    t.string   "name",                limit: 255
    t.string   "code",                limit: 255
    t.string   "url",                 limit: 255
    t.string   "thumbnail_url",       limit: 255
    t.integer  "playing_sec",         limit: 4
    t.string   "validity_start_date", limit: 255
    t.string   "validity_end_date",   limit: 255
    t.boolean  "enabled",                         default: true
    t.integer  "lock_version",        limit: 4,   default: 0
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "device_sub_contents", force: :cascade do |t|
    t.integer  "device_id",      limit: 4
    t.integer  "sub_content_id", limit: 4
    t.integer  "display_sec",    limit: 4
    t.integer  "display_order",  limit: 4
    t.boolean  "enabled",                  default: true
    t.integer  "lock_version",   limit: 4, default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "owner_id",              limit: 255
    t.integer  "display_frame_id",      limit: 4
    t.string   "temporary_content_url", limit: 255
    t.string   "emergency_message",     limit: 255
    t.integer  "play_volume",           limit: 4
    t.integer  "call_volume",           limit: 4
    t.integer  "lock_version",          limit: 4,   default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "display_frames", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "frame_pattern", limit: 4
    t.string   "image_url",     limit: 255
    t.integer  "lock_version",  limit: 4,   default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "playlist_contents", force: :cascade do |t|
    t.integer  "playlist_id",   limit: 4
    t.integer  "content_id",    limit: 4
    t.integer  "display_order", limit: 4
    t.integer  "lock_version",  limit: 4, default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "code",            limit: 255
    t.integer  "channel_id",      limit: 4
    t.string   "play_start_date", limit: 255
    t.string   "play_end_date",   limit: 255
    t.string   "release_date",    limit: 255
    t.integer  "lock_version",    limit: 4,   default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "sub_contents", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "url",          limit: 255
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "code",          limit: 255
    t.integer  "display_order", limit: 4
    t.integer  "lock_version",  limit: 4,   default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.integer  "lock_version",    limit: 4,   default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
