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

ActiveRecord::Schema.define(version: 2021_04_13_073340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.boolean "for_sale"
    t.integer "likes"
    t.string "description"
    t.string "caption"
    t.string "cid"
    t.string "name"
    t.string "tokenURI"
    t.string "contract_address"
    t.integer "tokenID"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_arts_on_category_id"
    t.index ["user_id"], name: "index_arts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "metamask_account"
    t.string "username"
    t.string "bio"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_users_on_artist_id"
  end

  add_foreign_key "arts", "categories"
  add_foreign_key "arts", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "users", "users", column: "artist_id"
end
