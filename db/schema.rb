# encoding: UTF-8
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140428204857) do
=======
ActiveRecord::Schema.define(version: 20140428214619) do
>>>>>>> fd6ac9d90d2ea733955d452cc3d0bd5f18563681

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "vimeo_videos", force: true do |t|
    t.string  "url"
    t.string  "description"
    t.integer "rating"
=======
  create_table "pictures", force: true do |t|
    t.string   "url",         null: false
    t.string   "description"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
>>>>>>> fd6ac9d90d2ea733955d452cc3d0bd5f18563681
  end

end
