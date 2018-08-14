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

ActiveRecord::Schema.define(version: 2018_08_14_185700) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "claims", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "name"
    t.text "text"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source", default: 0
    t.index ["email"], name: "index_claims_on_email"
    t.index ["name"], name: "index_claims_on_name"
    t.index ["phone_number"], name: "index_claims_on_phone_number"
  end

  create_table "configurations", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.integer "basic_type", default: 0
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_configurations_on_key"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.text "text"
    t.integer "position"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_reviews_on_first_name"
  end

  create_table "service_photos", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "position"
    t.boolean "is_main", default: true
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_service_photos_on_name"
    t.index ["service_id"], name: "index_service_photos_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.text "full_description"
    t.integer "price"
    t.integer "position"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_services_on_active"
    t.index ["name"], name: "index_services_on_name"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "title"
    t.boolean "active", default: true
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_specialities_on_active"
    t.index ["title"], name: "index_specialities_on_title"
  end

  create_table "speciality_vacancies", force: :cascade do |t|
    t.bigint "vacancy_id"
    t.bigint "speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["speciality_id"], name: "index_speciality_vacancies_on_speciality_id"
    t.index ["vacancy_id"], name: "index_speciality_vacancies_on_vacancy_id"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "title"
    t.string "country"
    t.string "city"
    t.integer "salary_min"
    t.integer "offers_quantity"
    t.integer "age_min"
    t.integer "age_max"
    t.boolean "is_hot", default: false
    t.boolean "is_on_main", default: false
    t.boolean "active", default: false
    t.text "info"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.date "arrive_date"
    t.integer "sex", default: 0
    t.integer "experience", default: 0
    t.index ["active"], name: "index_vacancies_on_active"
    t.index ["age_max"], name: "index_vacancies_on_age_max"
    t.index ["age_min"], name: "index_vacancies_on_age_min"
    t.index ["city"], name: "index_vacancies_on_city"
    t.index ["country"], name: "index_vacancies_on_country"
    t.index ["is_hot"], name: "index_vacancies_on_is_hot"
    t.index ["salary_min"], name: "index_vacancies_on_salary_min"
    t.index ["title"], name: "index_vacancies_on_title"
  end

  create_table "vacancy_photos", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "position"
    t.boolean "is_main", default: true
    t.bigint "vacancy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_vacancy_photos_on_name"
    t.index ["vacancy_id"], name: "index_vacancy_photos_on_vacancy_id"
  end

end
