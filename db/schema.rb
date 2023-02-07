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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_170334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums_artists", id: false, force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "artist_id", null: false
    t.index ["album_id", "artist_id"], name: "index_albums_artists_on_album_id_and_artist_id"
    t.index ["artist_id", "album_id"], name: "index_albums_artists_on_artist_id_and_album_id"
  end

  create_table "albums_songs", id: false, force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "song_id", null: false
    t.index ["album_id", "song_id"], name: "index_albums_songs_on_album_id_and_song_id"
    t.index ["song_id", "album_id"], name: "index_albums_songs_on_song_id_and_album_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_songs", id: false, force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "artist_id", null: false
    t.index ["artist_id", "song_id"], name: "index_artists_songs_on_artist_id_and_song_id"
    t.index ["song_id", "artist_id"], name: "index_artists_songs_on_song_id_and_artist_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "song_id", null: false
    t.index ["song_id"], name: "index_comments_on_song_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id", null: false
    t.bigint "user_id"
    t.bigint "genre_id"
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["genre_id"], name: "index_songs_on_genre_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "songs_tags", id: false, force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "tag_id", null: false
    t.index ["song_id", "tag_id"], name: "index_songs_tags_on_song_id_and_tag_id"
    t.index ["tag_id", "song_id"], name: "index_songs_tags_on_tag_id_and_song_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums_artists", "albums"
  add_foreign_key "albums_artists", "artists"
  add_foreign_key "albums_songs", "albums"
  add_foreign_key "albums_songs", "songs"
  add_foreign_key "artists_songs", "artists"
  add_foreign_key "artists_songs", "songs"
  add_foreign_key "comments", "songs"
  add_foreign_key "comments", "users"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "genres"
  add_foreign_key "songs", "users"
  add_foreign_key "songs_tags", "songs"
  add_foreign_key "songs_tags", "tags"
end
