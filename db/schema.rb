# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_405_200_439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'tracked_actions', force: :cascade do |t|
    t.string 'action'
    t.bigint 'tracking_link_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'user_agent'
    t.string 'client_ip_address'
    t.index ['tracking_link_id'], name: 'index_tracked_actions_on_tracking_link_id'
  end

  create_table 'tracking_links', force: :cascade do |t|
    t.string 'message_id'
    t.string 'recipient_email'
    t.string 'subject'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_tracking_links_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'tracked_actions', 'tracking_links'
  add_foreign_key 'tracking_links', 'users'
end
