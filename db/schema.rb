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

ActiveRecord::Schema.define(version: 20191204153320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.string   "instructions"
    t.integer  "course_id",    null: false
    t.integer  "points"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "time_limit"
    t.index ["course_id"], name: "index_challenges_on_course_id", using: :btree
  end

  create_table "challenges_people", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "challenge_id"
    t.index ["challenge_id"], name: "index_challenges_people_on_challenge_id", using: :btree
    t.index ["person_id"], name: "index_challenges_people_on_person_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "time_cost"
    t.string   "price"
    t.float    "required_points"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "courses_people", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_courses_people_on_course_id", using: :btree
    t.index ["person_id"], name: "index_courses_people_on_person_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_names"
    t.string   "last_names"
    t.date     "birth_date"
    t.string   "address"
    t.string   "mail"
    t.integer  "celphone_number"
    t.float    "total_points"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ranks_challenges", primary_key: ["challenge_id", "person_id"], force: :cascade do |t|
    t.serial   "id",           null: false
    t.boolean  "teacher"
    t.float    "points"
    t.boolean  "status"
    t.datetime "expire_date"
    t.date     "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "person_id",    null: false
    t.integer  "challenge_id", null: false
    t.index ["challenge_id"], name: "index_ranks_challenges_on_challenge_id", using: :btree
    t.index ["person_id"], name: "index_ranks_challenges_on_person_id", using: :btree
  end

  create_table "ranks_courses", primary_key: ["course_id", "person_id"], force: :cascade do |t|
    t.serial   "id",         null: false
    t.integer  "person_id",  null: false
    t.integer  "course_id",  null: false
    t.boolean  "teacher"
    t.float    "points"
    t.boolean  "status"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_ranks_courses_on_course_id", using: :btree
    t.index ["person_id"], name: "index_ranks_courses_on_person_id", using: :btree
  end

  add_foreign_key "challenges_people", "challenges"
  add_foreign_key "challenges_people", "people"
  add_foreign_key "courses_people", "courses"
  add_foreign_key "courses_people", "people"
  add_foreign_key "ranks_challenges", "challenges"
  add_foreign_key "ranks_challenges", "people"
  add_foreign_key "ranks_courses", "courses"
  add_foreign_key "ranks_courses", "people"
end
