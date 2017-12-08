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

ActiveRecord::Schema.define(version: 20171201020017) do

  create_table "category_tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_category"], name: "index_category_tours_on_name_category"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "review_id"
    t.bigint "user_id"
    t.text "content"
    t.integer "id_origin_cmt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "like_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "review_id"
    t.boolean "is_like", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_like_reviews_on_review_id"
    t.index ["user_id"], name: "index_like_reviews_on_user_id"
  end

  create_table "rate_tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "tour_id"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_rate_tours_on_tour_id"
    t.index ["user_id"], name: "index_rate_tours_on_user_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "tour_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
    t.index ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tourdetails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "tour_id"
    t.bigint "user_id"
    t.integer "num_of_pass"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_tourdetails_on_tour_id"
    t.index ["user_id"], name: "index_tourdetails_on_user_id"
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name_tour"
    t.text "content"
    t.datetime "starttime"
    t.datetime "endtime"
    t.integer "price"
    t.boolean "is_empty_slot", default: true
    t.boolean "is_open", default: true
    t.string "picture"
    t.bigint "category_tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_tour_id"], name: "index_tours_on_category_tour_id"
    t.index ["name_tour"], name: "index_tours_on_name_tour"
    t.index ["price"], name: "index_tours_on_price"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name_user"
    t.string "email"
    t.string "tel"
    t.string "password_digest"
    t.boolean "gender"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.boolean "admin"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "like_reviews", "reviews"
  add_foreign_key "like_reviews", "users"
  add_foreign_key "rate_tours", "tours"
  add_foreign_key "rate_tours", "users"
  add_foreign_key "reviews", "tours"
  add_foreign_key "reviews", "users"
  add_foreign_key "tourdetails", "tours"
  add_foreign_key "tourdetails", "users"
  add_foreign_key "tours", "category_tours"
end
