# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_06_001929) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "catno"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "urltitle"
    t.string "place"
    t.string "title"
    t.string "bannerimage"
    t.string "image"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventshavecats", force: :cascade do |t|
    t.integer "event_id"
    t.integer "category_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "urltitle"
    t.string "subtitle"
    t.string "image"
    t.string "smallimage"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "affiche"
  end

  create_table "newshavecats", force: :cascade do |t|
    t.integer "news_id"
    t.integer "category_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "filename"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rubriques", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "url"
    t.text "description"
    t.datetime "zoom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "zoom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "urltitle"
    t.string "ytlink"
  end

  create_table "videoshavecats", force: :cascade do |t|
    t.integer "video_id"
    t.integer "category_id"
  end

  create_table "wforecasts", force: :cascade do |t|
    t.date "date"
    t.string "icon"
    t.string "city"
    t.integer "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
