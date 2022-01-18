# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_15_170812) do

  create_table "notes", charset: "utf8mb4", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "players", charset: "utf8mb4", force: :cascade do |t|
    t.string "fideid", limit: 12
    t.string "name"
    t.string "country", limit: 3
    t.string "sex", limit: 1
    t.string "title", limit: 4
    t.string "w_title", limit: 4
    t.string "o_title", limit: 4
    t.string "foa_title", limit: 4
    t.string "rating", limit: 4
    t.string "games"
    t.string "k", limit: 2
    t.string "rapid_rating", limit: 4
    t.string "rapid_games"
    t.string "rapid_k", limit: 2
    t.string "blitz_rating", limit: 4
    t.string "blitz_games"
    t.string "blitz_k", limit: 2
    t.string "birthday"
    t.string "flag"
    t.datetime "created_at", precision: 6, default: "2022-01-18 16:06:36"
    t.datetime "updated_at", precision: 6, default: "2022-01-18 16:06:36"
    t.index ["fideid", "name"], name: "players_fideid_name_fulltext", type: :fulltext
    t.index ["fideid"], name: "index_players_on_fideid", unique: true
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username", limit: 30, null: false
    t.bigint "player_id"
    t.string "role", default: "user", null: false
    t.string "email", null: false
    t.string "name", limit: 100
    t.string "password_digest", null: false
    t.timestamp "email_verified_at"
    t.boolean "affiliated", default: false, null: false
    t.string "photo", limit: 120
    t.string "biography", limit: 750
    t.date "birthday"
    t.string "remember_token", limit: 100
    t.datetime "created_at", precision: 6, default: "2022-01-18 16:06:36"
    t.datetime "updated_at", precision: 6, default: "2022-01-18 16:06:36"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["player_id"], name: "index_users_on_player_id"
    t.index ["username", "name"], name: "users_username_name_fulltext", type: :fulltext
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "notes", "users"
  add_foreign_key "users", "players"
end
