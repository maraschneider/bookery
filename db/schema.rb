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

ActiveRecord::Schema.define(version: 2019_11_21_150142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "language"
    t.bigint "user_id"
    t.string "image_url"
    t.text "description"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "genre"
    t.boolean "rented", default: false
    t.string "book_cover", default: "image/upload/v1574343472/book_logo_hxmzkd"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.date "start_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "requested"
    t.index ["book_id"], name: "index_rentals_on_book_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_reader"
    t.index ["rental_id"], name: "index_reviews_on_rental_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "language"
    t.text "description"
    t.string "profile_pic", default: "https://cdn.designbyhumans.com/i/S0q2SgMDnZTMIquCovyU0uSSGP2U1OLM9LwY_VJDQ0MzC2MzoGyulZmpQQUQ6yRZGeoUWBkCAA.pr253160-2-2704838.jpg"
    t.string "profile_picture", default: "image/upload/v1574343472/jhud7dabpplnqwvpfufj.jpg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "rentals", "books"
  add_foreign_key "rentals", "users"
  add_foreign_key "reviews", "rentals"
end
