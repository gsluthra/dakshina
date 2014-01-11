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

ActiveRecord::Schema.define(version: 20140111094920) do

  create_table "capsules", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "study_text"
    t.text     "assignment_instructions"
    t.text     "guidelines_for_evaluators"
  end

  create_table "learning_path_elements", force: true do |t|
    t.integer  "learning_path_id"
    t.integer  "capsule_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learning_paths", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "objective"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
