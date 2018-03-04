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

ActiveRecord::Schema.define(version: 20180301150500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name",                                       null: false
    t.datetime "created_at", default: '2018-02-11 17:40:59', null: false
    t.datetime "updated_at", default: '2018-02-11 17:40:59', null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",                                      null: false
    t.integer  "faculty_id",                                 null: false
    t.datetime "created_at", default: '2018-02-11 17:40:59', null: false
    t.datetime "updated_at", default: '2018-02-11 17:40:59', null: false
    t.index ["faculty_id"], name: "index_courses_on_faculty_id", using: :btree
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",                                       null: false
    t.integer  "city_id",                                    null: false
    t.datetime "created_at", default: '2018-02-11 17:40:59', null: false
    t.datetime "updated_at", default: '2018-02-11 17:40:59', null: false
    t.index ["city_id"], name: "index_faculties_on_city_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "professor_id",                                       null: false
    t.string   "title",                                              null: false
    t.text     "description",                                        null: false
    t.integer  "number_of_sessions",                                 null: false
    t.boolean  "user_place",         default: false
    t.boolean  "professor_place",    default: true
    t.datetime "created_at",         default: '2018-02-11 17:40:59', null: false
    t.datetime "updated_at",         default: '2018-02-11 17:40:59', null: false
    t.boolean  "active",             default: true,                  null: false
    t.index ["professor_id"], name: "index_offers_on_professor_id", using: :btree
  end

  create_table "offers_subjects", force: :cascade do |t|
    t.integer  "offer_id",                                   null: false
    t.integer  "subject_id",                                 null: false
    t.datetime "created_at", default: '2018-02-11 17:40:59', null: false
    t.datetime "updated_at", default: '2018-02-11 17:40:59', null: false
    t.index ["offer_id", "subject_id"], name: "index_offers_subjects_on_offer_id_and_subject_id", unique: true, using: :btree
    t.index ["offer_id"], name: "index_offers_subjects_on_offer_id", using: :btree
    t.index ["subject_id"], name: "index_offers_subjects_on_subject_id", using: :btree
  end

  create_table "prices", force: :cascade do |t|
    t.integer "offer_id",      null: false
    t.integer "student_count", null: false
    t.decimal "price",         null: false
    t.index ["offer_id", "student_count", "price"], name: "index_prices_on_offer_id_and_student_count_and_price", unique: true, using: :btree
    t.index ["offer_id"], name: "index_prices_on_offer_id", using: :btree
  end

  create_table "professors", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "email"
    t.string   "mobile_phone"
    t.string   "phone"
    t.integer  "faculty_id"
    t.integer  "city_id"
    t.string   "facebook"
    t.string   "street_name"
    t.string   "street_number"
    t.string   "floor"
    t.string   "apartment_number"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_professors_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_professors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_professors_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_professors_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text    "comment"
    t.integer "rating",       null: false
    t.integer "professor_id", null: false
    t.integer "offer_id",     null: false
    t.integer "user_id",      null: false
    t.index ["offer_id"], name: "index_reviews_on_offer_id", using: :btree
    t.index ["professor_id"], name: "index_reviews_on_professor_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title",                                      null: false
    t.integer  "year",                                       null: false
    t.integer  "course_id",                                  null: false
    t.datetime "created_at", default: '2018-02-11 17:40:59', null: false
    t.datetime "updated_at", default: '2018-02-11 17:40:59', null: false
    t.index ["course_id"], name: "index_subjects_on_course_id", using: :btree
    t.index ["title", "course_id"], name: "index_subjects_on_title_and_course_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "email"
    t.string   "mobile_phone"
    t.integer  "course_id"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "courses", "faculties"
  add_foreign_key "faculties", "cities"
  add_foreign_key "offers", "professors"
  add_foreign_key "offers_subjects", "offers"
  add_foreign_key "offers_subjects", "subjects"
  add_foreign_key "prices", "offers"
  add_foreign_key "reviews", "professors"
  add_foreign_key "subjects", "courses"
end
