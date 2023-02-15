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

ActiveRecord::Schema[7.0].define(version: 2023_02_15_211733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entity_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentence_parts", force: :cascade do |t|
    t.string "text"
    t.integer "order"
    t.bigint "sentence_id"
    t.bigint "entity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type_id"], name: "index_sentence_parts_on_entity_type_id"
    t.index ["sentence_id"], name: "index_sentence_parts_on_sentence_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "analized", default: false
  end

end
