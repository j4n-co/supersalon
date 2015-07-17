# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150717211650) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contents", force: true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.string   "link_text"
    t.string   "context"
    t.boolean  "hide_title",              default: false
    t.integer  "position",                default: 999
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_categories", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_categories_posts", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "post_category_id"
  end

  create_table "post_products", force: true do |t|
    t.integer "post_id"
    t.integer "product_id"
    t.integer "position"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.string   "teaser"
    t.datetime "posted_at"
    t.text     "body"
    t.string   "author"
    t.boolean  "live",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_activator_translations", force: true do |t|
    t.integer  "spree_activator_id"
    t.string   "locale"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "spree_activator_translations", ["locale"], name: "index_spree_activator_translations_on_locale", using: :btree
  add_index "spree_activator_translations", ["spree_activator_id"], name: "index_spree_activator_translations_on_spree_activator_id", using: :btree

  create_table "spree_activators", force: true do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "event_name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy", default: "all"
    t.string   "code"
    t.boolean  "advertise",    default: false
    t.string   "path"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "spree_addresses", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "spree_addresses", ["firstname"], name: "index_addresses_on_firstname", using: :btree
  add_index "spree_addresses", ["lastname"], name: "index_addresses_on_lastname", using: :btree

  create_table "spree_adjustments", force: true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "adjustable_id"
    t.string   "adjustable_type"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.decimal  "amount",          precision: 10, scale: 0
    t.string   "label"
    t.boolean  "mandatory"
    t.boolean  "eligible",                                 default: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "state"
    t.integer  "order_id"
    t.boolean  "included",                                 default: false
  end

  add_index "spree_adjustments", ["adjustable_id"], name: "index_adjustments_on_order_id", using: :btree
  add_index "spree_adjustments", ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
  add_index "spree_adjustments", ["source_type", "source_id"], name: "index_spree_adjustments_on_source_type_and_source_id", using: :btree

  create_table "spree_assets", force: true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
  end

  add_index "spree_assets", ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
  add_index "spree_assets", ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree

  create_table "spree_authentication_methods", force: true do |t|
    t.string   "environment"
    t.string   "provider"
    t.string   "api_key"
    t.string   "api_secret"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_banks", force: true do |t|
    t.string   "name"
    t.string   "account_no"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "person_name"
    t.string   "address"
    t.string   "currency"
  end

  add_index "spree_banks", ["active"], name: "index_spree_banks_on_active", using: :btree
  add_index "spree_banks", ["name", "account_no"], name: "index_spree_banks_on_name_and_account_no", unique: true, using: :btree

  create_table "spree_blog_entries", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",      default: false
    t.datetime "published_at"
    t.text     "summary"
    t.integer  "author_id"
  end

  add_index "spree_blog_entries", ["author_id"], name: "index_spree_blog_entries_on_author_id", using: :btree

  create_table "spree_blogs", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_calculators", force: true do |t|
    t.string   "type"
    t.integer  "calculable_id"
    t.string   "calculable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "spree_configurations", force: true do |t|
    t.string   "name"
    t.string   "type",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "spree_configurations", ["name", "type"], name: "index_spree_configurations_on_name_and_type", using: :btree

  create_table "spree_contents", force: true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.string   "link_text"
    t.string   "context"
    t.boolean  "hide_title",              default: false
    t.integer  "position",                default: 999
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_countries", force: true do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
  end

  create_table "spree_credit_cards", force: true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "spree_currencies", force: true do |t|
    t.string   "num_code",                   null: false
    t.string   "char_code",                  null: false
    t.string   "name",                       null: false
    t.boolean  "basic",      default: false
    t.string   "locale"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "spree_currency_converters", force: true do |t|
    t.integer  "currency_id",               null: false
    t.datetime "date_req",                  null: false
    t.float    "nominal",     default: 1.0, null: false
    t.float    "value",                     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "spree_gateways", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "environment", default: "development"
    t.string   "server",      default: "test"
    t.boolean  "test_mode",   default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "spree_inventory_units", force: true do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.integer  "return_authorization_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "pending",                 default: true
  end

  add_index "spree_inventory_units", ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
  add_index "spree_inventory_units", ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
  add_index "spree_inventory_units", ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree

  create_table "spree_line_items", force: true do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                 null: false
    t.decimal  "price",           precision: 10, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "currency"
    t.decimal  "cost_price",      precision: 8,  scale: 2
    t.integer  "tax_category_id"
  end

  add_index "spree_line_items", ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
  add_index "spree_line_items", ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree

  create_table "spree_log_entries", force: true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "spree_option_type_translations", force: true do |t|
    t.integer  "spree_option_type_id"
    t.string   "locale"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.string   "presentation"
  end

  add_index "spree_option_type_translations", ["locale"], name: "index_spree_option_type_translations_on_locale", using: :btree
  add_index "spree_option_type_translations", ["spree_option_type_id"], name: "index_spree_option_type_translations_on_spree_option_type_id", using: :btree

  create_table "spree_option_types", force: true do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "spree_option_types_prototypes", id: false, force: true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_values", force: true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "spree_option_values_variants", id: false, force: true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_values_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree
  add_index "spree_option_values_variants", ["variant_id"], name: "index_spree_option_values_variants_on_variant_id", using: :btree

  create_table "spree_orders", force: true do |t|
    t.string   "number",               limit: 32
    t.decimal  "item_total",                      precision: 10, scale: 0, default: 0,       null: false
    t.decimal  "total",                           precision: 10, scale: 0, default: 0,       null: false
    t.string   "state"
    t.decimal  "adjustment_total",                precision: 10, scale: 0, default: 0,       null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                   precision: 10, scale: 0, default: 0
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.string   "channel",                                                  default: "spree"
    t.decimal  "tax_total",                       precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "invoice_number"
    t.date     "invoice_date"
    t.boolean  "agreed_to_terms",                                          default: false
  end

  add_index "spree_orders", ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
  add_index "spree_orders", ["number"], name: "index_spree_orders_on_number", using: :btree
  add_index "spree_orders", ["user_id"], name: "index_spree_orders_on_user_id", using: :btree

  create_table "spree_pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "show_in_header",           default: false, null: false
    t.boolean  "show_in_footer",           default: false, null: false
    t.string   "foreign_link"
    t.integer  "position",                 default: 1,     null: false
    t.boolean  "visible",                  default: true
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "layout"
    t.boolean  "show_in_sidebar",          default: false, null: false
    t.string   "meta_title"
    t.boolean  "render_layout_as_partial", default: false
  end

  add_index "spree_pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "spree_pages_old", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "show_in_header",           default: false, null: false
    t.boolean  "show_in_footer",           default: false, null: false
    t.string   "foreign_link"
    t.integer  "position",                 default: 1,     null: false
    t.boolean  "visible",                  default: false
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "layout"
    t.boolean  "show_in_sidebar",          default: false, null: false
    t.string   "meta_title"
    t.boolean  "render_layout_as_partial", default: false
    t.string   "nav_title"
    t.string   "path"
    t.boolean  "accessible",               default: true
  end

  add_index "spree_pages_old", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "spree_payment_methods", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "environment", default: "development"
    t.datetime "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "display_on"
  end

  create_table "spree_payments", force: true do |t|
    t.decimal  "amount",               precision: 10, scale: 0, default: 0, null: false
    t.integer  "order_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "identifier"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
  end

  add_index "spree_payments", ["order_id"], name: "index_spree_payments_on_order_id", using: :btree

  create_table "spree_paypal_accounts", force: true do |t|
    t.string "email"
    t.string "payer_id"
    t.string "payer_country"
    t.string "payer_status"
  end

  create_table "spree_paypal_express_checkouts", force: true do |t|
    t.string   "token"
    t.string   "payer_id"
    t.string   "transaction_id"
    t.string   "state",                 default: "complete"
    t.string   "refund_transaction_id"
    t.datetime "refunded_at"
    t.string   "refund_type"
    t.datetime "created_at"
  end

  add_index "spree_paypal_express_checkouts", ["transaction_id"], name: "index_spree_paypal_express_checkouts_on_transaction_id", using: :btree

  create_table "spree_post_categories", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_post_categories_posts", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "post_category_id"
  end

  create_table "spree_post_products", force: true do |t|
    t.integer "post_id"
    t.integer "product_id"
    t.integer "position"
  end

  create_table "spree_posts", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.string   "teaser"
    t.datetime "posted_at"
    t.text     "body"
    t.string   "author"
    t.boolean  "live",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blog_id"
  end

  create_table "spree_preferences", force: true do |t|
    t.text     "value"
    t.string   "key"
    t.string   "value_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spree_preferences", ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree

  create_table "spree_prices", force: true do |t|
    t.integer "variant_id",                          null: false
    t.decimal "amount",     precision: 10, scale: 2
    t.string  "currency"
  end

  add_index "spree_prices", ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree

  create_table "spree_product_imports", force: true do |t|
    t.string   "data_file_file_name"
    t.string   "data_file_content_type"
    t.integer  "data_file_file_size"
    t.datetime "data_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_product_option_types", force: true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "spree_product_properties", force: true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position",    default: 0
  end

  add_index "spree_product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree

  create_table "spree_product_translations", force: true do |t|
    t.integer  "spree_product_id"
    t.string   "locale"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.text     "description"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "permalink"
  end

  add_index "spree_product_translations", ["locale"], name: "index_spree_product_translations_on_locale", using: :btree
  add_index "spree_product_translations", ["spree_product_id"], name: "index_spree_product_translations_on_spree_product_id", using: :btree

  create_table "spree_products", force: true do |t|
    t.string   "name",                 default: "", null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "permalink"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "spree_products", ["available_on"], name: "index_spree_products_on_available_on", using: :btree
  add_index "spree_products", ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
  add_index "spree_products", ["name"], name: "index_spree_products_on_name", using: :btree
  add_index "spree_products", ["permalink"], name: "index_spree_products_on_permalink", using: :btree
  add_index "spree_products", ["permalink"], name: "permalink_idx_unique", using: :btree

  create_table "spree_products_promotion_rules", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_products_promotion_rules", ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
  add_index "spree_products_promotion_rules", ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id", using: :btree

  create_table "spree_products_taxons", force: true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position",   default: 0
  end

  add_index "spree_products_taxons", ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
  add_index "spree_products_taxons", ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree

  create_table "spree_promotion_action_line_items", force: true do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            default: 1
  end

  create_table "spree_promotion_actions", force: true do |t|
    t.integer "activator_id"
    t.integer "position"
    t.string  "type"
  end

  create_table "spree_promotion_rules", force: true do |t|
    t.integer  "activator_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "spree_promotion_rules", ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
  add_index "spree_promotion_rules", ["user_id"], name: "index_promotion_rules_on_user_id", using: :btree

  create_table "spree_promotion_rules_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rules_users", ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
  add_index "spree_promotion_rules_users", ["user_id"], name: "index_promotion_rules_users_on_user_id", using: :btree

  create_table "spree_properties", force: true do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "spree_properties_prototypes", force: true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
    t.integer "position",     default: 0
  end

  create_table "spree_property_translations", force: true do |t|
    t.integer  "spree_property_id"
    t.string   "locale"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "presentation"
  end

  add_index "spree_property_translations", ["locale"], name: "index_spree_property_translations_on_locale", using: :btree
  add_index "spree_property_translations", ["spree_property_id"], name: "index_spree_property_translations_on_spree_property_id", using: :btree

  create_table "spree_prototypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_relation_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "applies_to"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "spree_relations", force: true do |t|
    t.integer  "relation_type_id"
    t.integer  "relatable_id"
    t.string   "relatable_type"
    t.integer  "related_to_id"
    t.string   "related_to_type"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.decimal  "discount_amount",  precision: 10, scale: 0, default: 0
    t.integer  "position"
  end

  create_table "spree_return_authorizations", force: true do |t|
    t.string   "number"
    t.string   "state"
    t.decimal  "amount",            precision: 10, scale: 0, default: 0, null: false
    t.integer  "order_id"
    t.text     "reason"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "stock_location_id"
  end

  create_table "spree_roles", force: true do |t|
    t.string "name"
  end

  create_table "spree_roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_roles_users", ["role_id"], name: "index_spree_roles_users_on_role_id", using: :btree
  add_index "spree_roles_users", ["user_id"], name: "index_spree_roles_users_on_user_id", using: :btree

  create_table "spree_sale_prices", force: true do |t|
    t.integer  "price_id"
    t.decimal  "value",      precision: 10, scale: 2, null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
  end

  add_index "spree_sale_prices", ["price_id", "start_at", "end_at", "enabled"], name: "index_active_sale_prices_for_price", using: :btree
  add_index "spree_sale_prices", ["price_id"], name: "index_sale_prices_for_price", using: :btree
  add_index "spree_sale_prices", ["start_at", "end_at", "enabled"], name: "index_active_sale_prices_for_all_variants", using: :btree

  create_table "spree_shipments", force: true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",              precision: 10, scale: 0
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "stock_location_id"
  end

  add_index "spree_shipments", ["number"], name: "index_shipments_on_number", using: :btree
  add_index "spree_shipments", ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree

  create_table "spree_shipping_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_shipping_method_categories", force: true do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "spree_shipping_method_categories", ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
  add_index "spree_shipping_method_categories", ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree

  create_table "spree_shipping_methods", force: true do |t|
    t.string   "name"
    t.string   "display_on"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "position"
  end

  create_table "spree_shipping_methods_zones", id: false, force: true do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_rates", force: true do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                    default: false
    t.decimal  "cost",               precision: 10, scale: 0, default: 0
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "spree_shipping_rates", ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree

  create_table "spree_skrill_transactions", force: true do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "spree_state_changes", force: true do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "spree_states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
  end

  create_table "spree_stock_items", force: true do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
  end

  add_index "spree_stock_items", ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
  add_index "spree_stock_items", ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id", using: :btree

  create_table "spree_stock_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                 default: true
    t.boolean  "backorderable_default",  default: false
    t.boolean  "propagate_all_variants", default: true
    t.string   "admin_name"
  end

  create_table "spree_stock_movements", force: true do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        default: 0
    t.string   "action"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "originator_id"
    t.string   "originator_type"
  end

  add_index "spree_stock_movements", ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree

  create_table "spree_stock_transfers", force: true do |t|
    t.string   "type"
    t.string   "reference"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "number"
  end

  add_index "spree_stock_transfers", ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
  add_index "spree_stock_transfers", ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
  add_index "spree_stock_transfers", ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree

  create_table "spree_tax_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  default: false
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "spree_tax_rates", force: true do |t|
    t.decimal  "amount",             precision: 10, scale: 0
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                           default: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "name"
    t.boolean  "show_rate_in_label",                          default: true
    t.datetime "deleted_at"
  end

  create_table "spree_taxon_translations", force: true do |t|
    t.integer  "spree_taxon_id"
    t.string   "locale"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.text     "description"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "permalink"
  end

  add_index "spree_taxon_translations", ["locale"], name: "index_spree_taxon_translations_on_locale", using: :btree
  add_index "spree_taxon_translations", ["spree_taxon_id"], name: "index_spree_taxon_translations_on_spree_taxon_id", using: :btree

  create_table "spree_taxonomies", force: true do |t|
    t.string   "name",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "position",   default: 0
  end

  create_table "spree_taxonomy_translations", force: true do |t|
    t.integer  "spree_taxonomy_id"
    t.string   "locale"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
  end

  add_index "spree_taxonomy_translations", ["locale"], name: "index_spree_taxonomy_translations_on_locale", using: :btree
  add_index "spree_taxonomy_translations", ["spree_taxonomy_id"], name: "index_spree_taxonomy_translations_on_spree_taxonomy_id", using: :btree

  create_table "spree_taxons", force: true do |t|
    t.integer  "parent_id"
    t.integer  "position",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
  end

  add_index "spree_taxons", ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
  add_index "spree_taxons", ["permalink"], name: "index_taxons_on_permalink", using: :btree
  add_index "spree_taxons", ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree

  create_table "spree_tokenized_permissions", force: true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "spree_tokenized_permissions", ["permissable_id", "permissable_type"], name: "index_tokenized_name_and_type", using: :btree

  create_table "spree_trackers", force: true do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "spree_user_authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_users", force: true do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      default: 0, null: false
    t.integer  "failed_attempts",                    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "spree_api_key",          limit: 48
    t.datetime "remember_created_at"
    t.string   "nickname"
    t.string   "website_url"
    t.string   "google_plus_url"
    t.text     "bio_info"
  end

  add_index "spree_users", ["email"], name: "email_idx_unique", unique: true, using: :btree
  add_index "spree_users", ["spree_api_key"], name: "index_spree_users_on_spree_api_key", using: :btree

  create_table "spree_variants", force: true do |t|
    t.string   "sku",                                      default: "",    null: false
    t.decimal  "weight",          precision: 10, scale: 2
    t.decimal  "height",          precision: 10, scale: 2
    t.decimal  "width",           precision: 10, scale: 2
    t.decimal  "depth",           precision: 10, scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                default: false
    t.integer  "product_id"
    t.decimal  "cost_price",      precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency"
    t.boolean  "track_inventory",                          default: true
    t.datetime "updated_at"
  end

  add_index "spree_variants", ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
  add_index "spree_variants", ["sku"], name: "index_spree_variants_on_sku", using: :btree

  create_table "spree_zone_members", force: true do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.integer  "zone_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "spree_zones", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        default: false
    t.integer  "zone_members_count", default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "spree_zones_promotion_rules", force: true do |t|
    t.integer "zone_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_zones_promotion_rules", ["promotion_rule_id"], name: "index_spree_zones_promotion_rules_on_promotion_rule_id", using: :btree
  add_index "spree_zones_promotion_rules", ["zone_id"], name: "index_spree_zones_promotion_rules_on_zone_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
