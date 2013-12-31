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

ActiveRecord::Schema.define(version: 20131114121246) do

  create_table "app_configs", force: true do |t|
    t.datetime "beginning",                                                                                                        null: false
    t.datetime "ending",                                                                                                           null: false
    t.string   "mail_adress",                default: "",                                                                          null: false
    t.string   "mail_server",                default: "",                                                                          null: false
    t.string   "mail_user",                  default: "",                                                                          null: false
    t.string   "mail_password",              default: "",                                                                          null: false
    t.integer  "mail_port",                  default: 25,                                                                          null: false
    t.boolean  "mail_auth",                  default: false,                                                                       null: false
    t.text     "registration_complete_mail", default: "ErstiwochenendeMail nicht konfiguriert. Bitte weiterleiten an fsgi@wwu.de", null: false
    t.boolean  "waiting_list_open",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["token"], name: "index_tickets_on_token", unique: true

  create_table "users", force: true do |t|
    t.integer  "ticket_id"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "fname"
    t.string   "lname"
    t.integer  "gender"
    t.string   "street"
    t.string   "streetno"
    t.integer  "zip"
    t.string   "place"
    t.date     "birthday"
    t.integer  "study"
    t.boolean  "vegetarian"
    t.boolean  "vegan"
    t.string   "phone"
    t.text     "comment"
    t.boolean  "admin",                  default: false
    t.boolean  "withdrawn",              default: false
    t.datetime "withdrawn_at"
    t.text     "withdraw_comment"
    t.boolean  "from_waiting_list",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "waitings", force: true do |t|
    t.string   "email",                default: "", null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "waitings", ["confirmation_token"], name: "index_waitings_on_confirmation_token", unique: true
  add_index "waitings", ["email"], name: "index_waitings_on_email", unique: true

end
