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

ActiveRecord::Schema.define(:version => 20120430051427) do

  create_table "admins", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "import_id"
    t.string   "item_detail"
    t.datetime "invoice_datetime"
    t.integer  "amount"
    t.string   "vendor"
    t.string   "branch"
    t.string   "payment_method"
    t.string   "summary"
    t.string   "status",           :default => "pending"
    t.string   "comment"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "head_organizations", :force => true do |t|
    t.string   "name"
    t.string   "facebook_page"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "imports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "spreadsheet_file_name"
    t.string   "spreadsheet_content_type"
    t.integer  "spreadsheet_file_size"
    t.datetime "spreadsheet_updated_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lectures", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "video_address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "limits", :force => true do |t|
    t.integer  "team_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "head_organization_id"
    t.string   "facebook_page"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "facebook_page"
    t.integer  "organization_id"
    t.integer  "leader_user_id"
    t.string   "bank_branch"
    t.string   "account_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.integer  "facebook_uid",           :limit => 8
    t.string   "facebook_token"
    t.integer  "team_id"
    t.string   "status",                              :default => "pending"
    t.integer  "organization_id"
    t.string   "email",                               :default => "",        :null => false
    t.string   "encrypted_password",                  :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.integer  "head_organization_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weekreports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "start"
    t.datetime "end"
    t.string   "participants"
    t.string   "location"
    t.string   "goal"
    t.text     "contents"
    t.text     "result"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
