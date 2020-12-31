ActiveRecord::Schema.define(version: 2020_12_29_212650) do

  enable_extension "plpgsql"

  create_table "catpics", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
