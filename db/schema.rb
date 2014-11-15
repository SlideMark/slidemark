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

ActiveRecord::Schema.define(version: 20141113015346) do

  create_table "posts", force: true do |t|
    t.integer  "user_id",                          null: false
    t.string   "title",                            null: false
    t.integer  "status",     limit: 1, default: 0, null: false
    t.string   "tag"
    t.binary   "content",                          null: false
    t.integer  "setting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.integer  "controls",                limit: 1, default: 1,         null: false
    t.integer  "progress",                limit: 1, default: 1,         null: false
    t.integer  "slideNumber",             limit: 1, default: 0,         null: false
    t.integer  "history",                 limit: 1, default: 0,         null: false
    t.integer  "keyboard",                limit: 1, default: 1,         null: false
    t.integer  "overview",                limit: 1, default: 1,         null: false
    t.integer  "center",                  limit: 1, default: 1,         null: false
    t.integer  "touch",                   limit: 1, default: 1,         null: false
    t.integer  "loop",                    limit: 1, default: 0,         null: false
    t.integer  "rtl",                     limit: 1, default: 0,         null: false
    t.integer  "fragments",               limit: 1, default: 1,         null: false
    t.integer  "embedded",                limit: 1, default: 0,         null: false
    t.integer  "autoSlide",               limit: 1, default: 1,         null: false
    t.integer  "autoSlideStoppable",      limit: 1, default: 1,         null: false
    t.integer  "mouseWheel",              limit: 1, default: 0,         null: false
    t.integer  "hideAddressBar",          limit: 1, default: 1,         null: false
    t.integer  "previewLinks",            limit: 1, default: 0,         null: false
    t.string   "transition",                        default: "default", null: false
    t.string   "transitionSpeed",                   default: "default", null: false
    t.string   "backgroundTransition",              default: "default", null: false
    t.integer  "viewDistance",            limit: 2,                     null: false
    t.string   "parallaxBackgroundImage"
    t.string   "parallaxBackgroundSize"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",                    default: "", null: false
    t.string   "provider",               default: "", null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
