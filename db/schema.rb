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

ActiveRecord::Schema.define(version: 20160512162519) do

  create_table "dogs", force: :cascade do |t|
    t.string   "breed"
    t.string   "color"
    t.boolean  "gender"
    t.string   "found_location"
    t.date     "found_date"
    t.text     "description"
    t.string   "number"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_file_name_file_name"
    t.string   "image_file_name_content_type"
    t.integer  "image_file_name_file_size"
    t.datetime "image_file_name_updated_at"
    t.string   "image_content_type_file_name"
    t.string   "image_content_type_content_type"
    t.integer  "image_content_type_file_size"
    t.datetime "image_content_type_updated_at"
  end

end
