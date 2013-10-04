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

ActiveRecord::Schema.define(version: 20131004110955) do

  create_table "registrations", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.integer  "gender"
    t.string   "street"
    t.string   "streetno"
    t.integer  "zip"
    t.string   "place"
    t.date     "birthday"
    t.integer  "study"
    t.boolean  "vegetarian"
    t.boolean  "vegan"
    t.string   "ticket"
    t.string   "phone"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["email"], name: "index_registrations_on_email", unique: true

  create_table "tickets", force: true do |t|
    t.string   "ticket"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["ticket"], name: "index_tickets_on_ticket", unique: true

end
