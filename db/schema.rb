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

ActiveRecord::Schema.define(version: 20181219072514) do

  create_table "building_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "about",      limit: 65535,                 null: false
    t.text     "status",     limit: 65535,                 null: false
    t.string   "price",                                    null: false
    t.boolean  "rent",                     default: false, null: false
    t.integer  "item_id",                                  null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["item_id"], name: "index_building_infos_on_item_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "path_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "raw",        null: false
    t.string   "amount"
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_food_infos_on_item_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",                  null: false
    t.text     "memo",       limit: 65535
    t.integer  "item_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "item_usages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.integer  "usage_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "usage_id"], name: "index_item_usages_on_item_id_and_usage_id", unique: true, using: :btree
    t.index ["item_id"], name: "index_item_usages_on_item_id", using: :btree
    t.index ["usage_id"], name: "index_item_usages_on_usage_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                         null: false
    t.integer  "status",                        null: false
    t.text     "profile",         limit: 65535, null: false
    t.text     "remark",          limit: 65535
    t.integer  "state",                         null: false
    t.string   "city",                          null: false
    t.text     "comment",         limit: 65535
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "path_name"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["sub_category_id"], name: "index_items_on_sub_category_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "items_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "tag_id"], name: "index_items_tags_on_item_id_and_tag_id", unique: true, using: :btree
    t.index ["item_id"], name: "index_items_tags_on_item_id", using: :btree
    t.index ["tag_id"], name: "index_items_tags_on_tag_id", using: :btree
  end

  create_table "manager_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category",     null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phone_number"
    t.index ["user_id"], name: "index_manager_profiles_on_user_id", using: :btree
  end

  create_table "owner_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owner_profiles_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.string   "comment"
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_pictures_on_item_id", using: :btree
  end

  create_table "sub_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        null: false
    t.string   "path_name",   null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                       null: false
    t.boolean  "official",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "usages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "frist_name",                                    null: false
    t.string   "last_name",                                     null: false
    t.string   "email",                                         null: false
    t.string   "password_digest",                               null: false
    t.integer  "state",                                         null: false
    t.string   "city",                                          null: false
    t.string   "avatar"
    t.text     "profile",         limit: 65535
    t.boolean  "owner",                         default: false, null: false
    t.boolean  "manager",                       default: false, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "remember_digest"
    t.boolean  "admin",                         default: false
  end

  add_foreign_key "building_infos", "items"
  add_foreign_key "food_infos", "items"
  add_foreign_key "images", "items"
  add_foreign_key "item_usages", "items"
  add_foreign_key "item_usages", "usages"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "sub_categories"
  add_foreign_key "items", "users"
  add_foreign_key "items_tags", "items"
  add_foreign_key "items_tags", "tags"
  add_foreign_key "manager_profiles", "users"
  add_foreign_key "owner_profiles", "users"
  add_foreign_key "pictures", "items"
  add_foreign_key "sub_categories", "categories"
end
