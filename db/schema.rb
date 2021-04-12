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

ActiveRecord::Schema.define(version: 2021_04_12_181414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "arts", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.bigint "user_id", null: false
    t.bigint "artist_id", null: false
    t.bigint "category_id", null: false
    t.boolean "for_sale"
    t.integer "likes"
    t.string "slug"
    t.string "description"
    t.string "caption"
    t.float "value"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_arts_on_artist_id"
    t.index ["category_id"], name: "index_arts_on_category_id"
    t.index ["collection_id"], name: "index_arts_on_collection_id"
    t.index ["user_id"], name: "index_arts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "type"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "art_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["art_id"], name: "index_comments_on_art_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "art_id", null: false
    t.string "event"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["art_id"], name: "index_events_on_art_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "artists", "users"
  add_foreign_key "arts", "artists"
  add_foreign_key "arts", "categories"
  add_foreign_key "arts", "collections"
  add_foreign_key "arts", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "comments", "arts"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "arts"
end
