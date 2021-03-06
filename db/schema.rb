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

ActiveRecord::Schema.define(version: 20131014051120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "element_types", force: true do |t|
    t.string   "name"
    t.string   "before_tag"
    t.string   "after_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", force: true do |t|
    t.integer  "slide_id"
    t.integer  "element_type_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "width"
    t.string   "heigth"
    t.string   "top"
    t.string   "left"
  end

  create_table "slides", force: true do |t|
    t.integer  "slideshow_id"
    t.integer  "creator_id"
    t.string   "title"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "background_color", default: "rgb(210,210,210)"
    t.string   "color"
  end

  create_table "slideshows", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "shared",     default: false
    t.integer  "px_width",   default: 1280
    t.integer  "px_height",  default: 720
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
