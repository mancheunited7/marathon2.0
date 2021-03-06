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

ActiveRecord::Schema.define(version: 20180301141953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "big_catergories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_infos", force: :cascade do |t|
    t.date "day"
    t.string "name"
    t.string "place"
    t.string "site"
    t.string "road"
    t.string "trail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_results", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "day", null: false
    t.string "address", default: "", null: false
    t.string "competition_place", default: "", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.decimal "distance", null: false
    t.string "competition_name", null: false
    t.integer "hour"
    t.integer "minute"
    t.integer "second"
    t.integer "calc_time", null: false
    t.integer "heart_rate"
    t.text "content", default: "", null: false
    t.string "competition_result_photo"
    t.string "competition_result_photo_cache"
    t.integer "competition_point", null: false
    t.text "competition_memo", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weather"
    t.decimal "temperature"
    t.decimal "humidity"
    t.decimal "wind_speed"
    t.decimal "lap"
    t.decimal "body_fat"
    t.decimal "weight"
  end

  create_table "practices", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "day", null: false
    t.decimal "distance", null: false
    t.integer "hour", null: false
    t.integer "minute", null: false
    t.integer "second", null: false
    t.text "content", null: false
    t.decimal "weight"
    t.integer "heart_rate"
    t.string "practice_photo"
    t.string "practice_photo_cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weather"
    t.decimal "temperature"
    t.decimal "humidity"
    t.decimal "wind_speed"
    t.decimal "lap"
    t.decimal "body_fat"
  end

  create_table "question_wanteds", force: :cascade do |t|
    t.string "big_category"
    t.string "small_category"
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.string "state"
    t.integer "comment"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "big_catergories_id"
    t.integer "small_catergories_id"
  end

  create_table "run_friends", force: :cascade do |t|
    t.integer "follow_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id", "followed_id"], name: "index_run_friends_on_follow_id_and_followed_id", unique: true
    t.index ["follow_id"], name: "index_run_friends_on_follow_id"
    t.index ["followed_id"], name: "index_run_friends_on_followed_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "small_catergories", force: :cascade do |t|
    t.string "category"
    t.integer "big_catergory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "userid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "image_url"
    t.string "name"
    t.string "avatar"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "userid", "provider"], name: "index_users_on_email_and_userid_and_provider", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
