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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130609135802) do

  create_table "hackers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "git_url"
    t.string   "twitter_url"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "project_img"
    t.string   "project_des"
    t.string   "project_url"
    t.string   "hackernews_url"
    t.string   "tag_line"
    t.string   "location"
    t.string   "title"
    t.string   "linkedin_url"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "hacker_id"
    t.decimal  "amount",            :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "fee",               :precision => 10, :scale => 2, :default => 0.0
    t.string   "charge_identifier"
    t.boolean  "test_mode",                                        :default => false
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  add_index "payments", ["hacker_id"], :name => "index_payments_on_hacker_id"
  add_index "payments", ["test_mode"], :name => "index_payments_on_test_mode"

end
