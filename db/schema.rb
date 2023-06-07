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

ActiveRecord::Schema[7.0].define(version: 2023_04_11_082854) do
  create_table "borangs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nama_penuh"
    t.string "no_ic"
    t.string "jawatan"
    t.date "tarikh_anugerah"
    t.string "alamat_pejabat"
    t.string "alamat_surat"
    t.string "alamat_rumah"
    t.string "alamat_emel"
    t.string "no_pejabat"
    t.string "no_fax"
    t.string "no_rumah"
    t.string "no_tel"
    t.string "nama_pasangan"
    t.string "no_ic_pasangan"
    t.string "no_tel_pasangan"
    t.string "no_rumah_pasangan"
    t.string "darjah_pasangan"
    t.string "no_kenderaanf"
    t.string "jenis_kenderaanf"
    t.string "gambar_ahli"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.bigint "darjah_negeri_id", null: false
    t.bigint "darjah_kebesaran_id", null: false
    t.float "total_price"
    t.text "messkit"
    t.index ["darjah_kebesaran_id"], name: "index_borangs_on_darjah_kebesaran_id"
    t.index ["darjah_negeri_id"], name: "index_borangs_on_darjah_negeri_id"
    t.index ["user_id"], name: "index_borangs_on_user_id"
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "payment_status"
    t.string "order_number"
    t.string "buyer_name"
    t.string "buyer_phone"
    t.string "buyer_email"
    t.string "payment_id"
    t.string "status_url"
    t.string "retry_url"
    t.string "receipt_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "borang_id"
    t.float "transaction_amount"
    t.index ["borang_id"], name: "fk_rails_2ef4c894ec"
  end

  create_table "ranks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "darjah"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_ranks_on_state_id"
  end

  create_table "states", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "negeri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "validated", default: false
    t.boolean "admin", default: false
    t.string "nama_penuh"
    t.string "no_ic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payments", "borangs"
  add_foreign_key "ranks", "states"
end
