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

ActiveRecord::Schema.define(version: 2022_01_17_134222) do

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fideid", "name"], name: "players_fideid_name_fulltext", type: :fulltext
    t.index ["fideid"], name: "index_players_on_fideid", unique: true
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "notes", "users"
end
