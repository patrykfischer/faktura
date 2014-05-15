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

ActiveRecord::Schema.define(version: 20140515161201) do

  create_table "companies", force: true do |t|
    t.integer  "user_id"
    t.string   "company_name"
    t.string   "nip"
    t.string   "place_of_taxes"
    t.string   "city"
    t.string   "street"
    t.string   "zip_code"
    t.string   "bank"
    t.string   "account_number"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_invoice"
    t.date     "data_of_sold"
    t.date     "data_build"
    t.string   "method_of_payment"
    t.integer  "id_own_company"
    t.integer  "id_invoice_company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
