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

ActiveRecord::Schema[8.0].define(version: 2025_09_28_180440) do
  create_table "campfire_rooms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_campfire_rooms_on_trip_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.text "content", null: false
    t.integer "campfire_room_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campfire_room_id"], name: "index_chat_messages_on_campfire_room_id"
    t.index ["created_at"], name: "index_chat_messages_on_created_at"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.integer "message_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["created_at"], name: "index_comments_on_created_at"
    t.index ["message_id"], name: "index_comments_on_message_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "trip_id", null: false
    t.integer "uploaded_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_documents_on_created_at"
    t.index ["trip_id"], name: "index_documents_on_trip_id"
    t.index ["uploaded_by_id"], name: "index_documents_on_uploaded_by_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "starts_at", null: false
    t.datetime "ends_at"
    t.string "location"
    t.boolean "all_day", default: false
    t.integer "schedule_id", null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_events_on_created_by_id"
    t.index ["schedule_id"], name: "index_events_on_schedule_id"
    t.index ["starts_at"], name: "index_events_on_starts_at"
  end

  create_table "message_boards", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "pinned", default: false
    t.integer "trip_id", null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_message_boards_on_created_by_id"
    t.index ["pinned"], name: "index_message_boards_on_pinned"
    t.index ["trip_id"], name: "index_message_boards_on_trip_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.integer "message_board_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["created_at"], name: "index_messages_on_created_at"
    t.index ["message_board_id"], name: "index_messages_on_message_board_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_schedules_on_trip_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "todo_items", force: :cascade do |t|
    t.text "content", null: false
    t.text "notes"
    t.boolean "completed", default: false
    t.date "due_date"
    t.integer "todo_list_id", null: false
    t.integer "created_by_id", null: false
    t.integer "assigned_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_todo_items_on_assigned_to_id"
    t.index ["completed"], name: "index_todo_items_on_completed"
    t.index ["created_by_id"], name: "index_todo_items_on_created_by_id"
    t.index ["due_date"], name: "index_todo_items_on_due_date"
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "completed", default: false
    t.integer "trip_id", null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed"], name: "index_todo_lists_on_completed"
    t.index ["created_by_id"], name: "index_todo_lists_on_created_by_id"
    t.index ["trip_id"], name: "index_todo_lists_on_trip_id"
  end

  create_table "trip_memberships", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "user_id", null: false
    t.integer "role", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "invited_at"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id", "user_id"], name: "index_trip_memberships_on_trip_id_and_user_id", unique: true
    t.index ["trip_id"], name: "index_trip_memberships_on_trip_id"
    t.index ["user_id"], name: "index_trip_memberships_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "destination"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "status", default: 0, null: false
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_trips_on_creator_id"
    t.index ["start_date"], name: "index_trips_on_start_date"
    t.index ["status"], name: "index_trips_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "campfire_rooms", "trips"
  add_foreign_key "chat_messages", "campfire_rooms"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "comments", "messages"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "documents", "trips"
  add_foreign_key "documents", "users", column: "uploaded_by_id"
  add_foreign_key "events", "schedules"
  add_foreign_key "events", "users", column: "created_by_id"
  add_foreign_key "message_boards", "trips"
  add_foreign_key "message_boards", "users", column: "created_by_id"
  add_foreign_key "messages", "message_boards"
  add_foreign_key "messages", "users", column: "author_id"
  add_foreign_key "schedules", "trips"
  add_foreign_key "sessions", "users"
  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "todo_items", "users", column: "assigned_to_id"
  add_foreign_key "todo_items", "users", column: "created_by_id"
  add_foreign_key "todo_lists", "trips"
  add_foreign_key "todo_lists", "users", column: "created_by_id"
  add_foreign_key "trip_memberships", "trips"
  add_foreign_key "trip_memberships", "users"
  add_foreign_key "trips", "users", column: "creator_id"
end
