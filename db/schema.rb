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

ActiveRecord::Schema.define(version: 2022_01_24_035714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "client_id"
    t.string "address_type"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.string "time_at_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "aliases", force: :cascade do |t|
    t.string "name"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_aliases_on_client_id"
  end

  create_table "business_debts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "client_id"
    t.string "name"
    t.string "business_type"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "province"
    t.string "structure"
    t.string "loans_guaranteed"
    t.text "details"
    t.string "location_of_records"
    t.date "last_financial_statement"
    t.string "year_end"
    t.integer "share_percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_businesses_on_client_id"
  end

  create_table "client_proposals", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "proposal_id"
    t.string "client_role"
    t.index ["client_id"], name: "index_client_proposals_on_client_id"
    t.index ["proposal_id"], name: "index_client_proposals_on_proposal_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "current_addresses", force: :cascade do |t|
    t.bigint "client_id"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.string "time_at_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_current_addresses_on_client_id"
  end

  create_table "employment_insurance_claims", force: :cascade do |t|
    t.bigint "client_id"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_employment_insurance_claims_on_client_id"
  end

  create_table "employments", force: :cascade do |t|
    t.bigint "client_id"
    t.string "employment_type"
    t.string "employer"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "province"
    t.string "position"
    t.date "start_date"
    t.date "end_date"
    t.boolean "current"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_employments_on_client_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.bigint "client_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "relationship"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.date "date_of_birth"
    t.string "income"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_family_members_on_client_id"
  end

  create_table "identifications", force: :cascade do |t|
    t.bigint "client_id"
    t.string "drivers_license"
    t.string "social_insurance_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_identifications_on_client_id"
  end

  create_table "personal_details", force: :cascade do |t|
    t.bigint "client_id"
    t.date "date_of_birth"
    t.integer "marital_status"
    t.integer "gender"
    t.integer "family_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_personal_details_on_client_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number"
    t.integer "number_type"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_phone_numbers_on_client_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.boolean "joint"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: 6
    t.datetime "confirmation_sent_at", precision: 6
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
