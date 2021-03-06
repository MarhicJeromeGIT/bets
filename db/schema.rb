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

ActiveRecord::Schema.define(version: 20160514102005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.string   "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "poule"
    t.string   "iso"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "owner_player_id"
    t.string   "password"
  end

  create_table "events_players", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "player_id"
  end

  add_index "events_players", ["event_id"], name: "index_events_players_on_event_id", using: :btree
  add_index "events_players", ["player_id"], name: "index_events_players_on_player_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.string   "host_name"
    t.string   "guest_name"
    t.string   "result"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

end
