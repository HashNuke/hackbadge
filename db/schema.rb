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

ActiveRecord::Schema.define(:version => 20110731002851) do

  create_table "commits", :force => true do |t|
    t.integer  "project_id"
    t.text     "commit_sha"
    t.string   "author_name"
    t.string   "author_email"
    t.integer  "author_user_id"
    t.datetime "commit_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "commit_msg"
  end

  create_table "contributors", :force => true do |t|
    t.string   "nickname"
    t.text     "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "github_repo_name"
    t.integer  "user_id"
    t.boolean  "private_repo"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "project_url"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.string   "nickname"
    t.string   "gravatar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
