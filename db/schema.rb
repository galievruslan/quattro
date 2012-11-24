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

ActiveRecord::Schema.define(:version => 20121124120850) do

  create_table "action_registrations", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "vehicle_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "bodies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "value"
    t.integer  "company_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_photos", :force => true do |t|
    t.boolean  "default"
    t.string   "image_name"
    t.string   "image_uid"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "description"
    t.date     "finish_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.integer  "rating"
  end

  create_table "projects_services", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "service_id"
  end

  create_table "projects_vehicles", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "vehicle_id"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "model_id"
    t.integer  "body_id"
    t.integer  "actionregistration_id"
    t.integer  "year"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
