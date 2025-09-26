# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_26_073746) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "vector"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "amenity_groups", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "knowledge_chunk_id"
    t.index ["knowledge_chunk_id"], name: "index_amenity_groups_on_knowledge_chunk_id"
  end

  create_table "chat_bots", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_chat_bots_on_admin_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.string "title"
    t.index ["employee_id"], name: "index_chats_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_employees_on_confirmation_token", unique: true
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.time "close_time"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "open_time"
    t.bigint "knowledge_chunk_id"
    t.index ["knowledge_chunk_id"], name: "index_facilities_on_knowledge_chunk_id"
  end

  create_table "knowledge_chunks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.vector "embedding", limit: 1536
    t.string "title"
    t.text "content"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.string "role"
    t.text "content"
    t.string "model_id"
    t.integer "input_tokens"
    t.integer "output_tokens"
    t.bigint "tool_call_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["tool_call_id"], name: "index_messages_on_tool_call_id"
  end

  create_table "room_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "knowledge_chunk_id"
    t.index ["knowledge_chunk_id"], name: "index_room_categories_on_knowledge_chunk_id"
  end

  create_table "room_lists", force: :cascade do |t|
    t.string "room_type_name"
    t.integer "square_meters"
    t.integer "capacity"
    t.string "bed_type"
    t.integer "bed_quantity"
    t.boolean "htwn"
    t.bigint "room_category_id", null: false
    t.bigint "amenity_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "knowledge_chunk_id"
    t.index ["amenity_group_id"], name: "index_room_lists_on_amenity_group_id"
    t.index ["knowledge_chunk_id"], name: "index_room_lists_on_knowledge_chunk_id"
    t.index ["room_category_id"], name: "index_room_lists_on_room_category_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tool_calls", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.string "tool_call_id", null: false
    t.string "name", null: false
    t.jsonb "arguments", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_tool_calls_on_message_id"
    t.index ["tool_call_id"], name: "index_tool_calls_on_tool_call_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "amenity_groups", "knowledge_chunks"
  add_foreign_key "chat_bots", "admins"
  add_foreign_key "chats", "employees"
  add_foreign_key "facilities", "knowledge_chunks"
  add_foreign_key "messages", "chats"
  add_foreign_key "room_categories", "knowledge_chunks"
  add_foreign_key "room_lists", "amenity_groups"
  add_foreign_key "room_lists", "knowledge_chunks"
  add_foreign_key "room_lists", "room_categories"
  add_foreign_key "sessions", "users"
  add_foreign_key "tool_calls", "messages"
end
