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

ActiveRecord::Schema[7.0].define(version: 2023_05_04_011254) do
  create_table "active_admin_comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
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

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "agent_groups", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_positions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birthdate"
    t.string "mobile_number"
    t.bigint "agent_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agent_position_id"
    t.index ["agent_group_id"], name: "index_agents_on_agent_group_id"
    t.index ["agent_position_id"], name: "index_agents_on_agent_position_id"
  end

  create_table "agreement_benefits", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agreements", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "anniv_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "anniversaries", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.date "anniversary_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batch_dependents", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "coop_dependent_id"
    t.float "premium"
    t.bigint "agreement_benefit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_benefit_id"], name: "index_batch_dependents_on_agreement_benefit_id"
    t.index ["batch_id"], name: "index_batch_dependents_on_batch_id"
    t.index ["coop_dependent_id"], name: "index_batch_dependents_on_coop_dependent_id"
  end

  create_table "batch_health_decs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.bigint "health_dec_question_id", null: false
    t.decimal "sub_rate", precision: 10
    t.decimal "sub_prem", precision: 10
    t.decimal "sub_coverage", precision: 10
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ans_q1"
    t.string "ans_q2"
    t.string "ans_q3"
    t.string "ans_q3_desc"
    t.string "ans_q4"
    t.string "ans_q4_desc"
    t.string "ans_q5_a"
    t.string "ans_q5_a_desc"
    t.string "ans_q5_b"
    t.string "ans_q5_b_desc"
    t.index ["batch_id"], name: "index_batch_health_decs_on_batch_id"
    t.index ["health_dec_question_id"], name: "index_batch_health_decs_on_health_dec_question_id"
  end

  create_table "batches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "coop_member_id"
    t.bigint "group_remit_id"
    t.date "effectivity_date"
    t.date "expiry_date"
    t.boolean "active"
    t.float "coop_sf_amount"
    t.float "agent_sf_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "premium", precision: 15, scale: 2
    t.string "status"
    t.string "insurance_status"
    t.index ["coop_member_id"], name: "index_batches_on_coop_member_id"
    t.index ["group_remit_id"], name: "index_batches_on_group_remit_id"
  end

  create_table "benefits", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestabilities", charset: "utf8mb4", force: :cascade do |t|
    t.integer "min_age"
    t.integer "max_age"
    t.string "member_type"
    t.decimal "period", precision: 6, scale: 2
    t.string "period_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coop_branches", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "province"
    t.string "municipality"
    t.string "barangay"
    t.string "contact_details"
    t.bigint "cooperative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "street"
    t.index ["cooperative_id"], name: "index_coop_branches_on_cooperative_id"
  end

  create_table "coop_member_beneficiaries", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.date "birthdate"
    t.bigint "coop_member_id"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coop_member_id"], name: "index_coop_member_beneficiaries_on_coop_member_id"
  end

  create_table "coop_member_dependents", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.date "birthdate"
    t.bigint "coop_member_id", null: false
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coop_member_id"], name: "index_coop_member_dependents_on_coop_member_id"
  end

  create_table "coop_members", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.bigint "coop_branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.index ["coop_branch_id"], name: "index_coop_members_on_coop_branch_id"
    t.index ["cooperative_id"], name: "index_coop_members_on_cooperative_id"
    t.index ["member_id"], name: "index_coop_members_on_member_id"
  end

  create_table "coop_users", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birthdate"
    t.string "mobile_number"
    t.string "designation"
    t.bigint "cooperative_id"
    t.bigint "coop_branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coop_branch_id"], name: "index_coop_users_on_coop_branch_id"
    t.index ["cooperative_id"], name: "index_coop_users_on_cooperative_id"
  end

  create_table "cooperatives", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "province"
    t.string "municipality"
    t.string "barangay"
    t.string "contact_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "registration_number"
    t.integer "tin_number"
    t.string "cooperative_type"
    t.string "acronym"
    t.string "street"
  end

  create_table "departments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birthdate"
    t.string "employee_number"
    t.string "mobile_number"
    t.string "designation"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "group_remits", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "moa_id"
    t.index ["moa_id"], name: "index_group_remits_on_moa_id"
  end

  create_table "gyrt_loadings", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "rate", precision: 5, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyrt_rate_multipliers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "benefit_id"
    t.integer "min_count"
    t.integer "max_count"
    t.decimal "rate", precision: 6, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_gyrt_rate_multipliers_on_benefit_id"
  end

  create_table "gyrt_rates", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "benefit_id"
    t.integer "age"
    t.decimal "rate", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_gyrt_rates_on_benefit_id"
  end

  create_table "health_dec_questions", charset: "utf8mb4", force: :cascade do |t|
    t.text "question_1"
    t.text "question_2"
    t.text "question_3"
    t.text "question_3_desc"
    t.text "question_4"
    t.text "question_4_desc"
    t.text "question_5_a"
    t.text "question_5_a_desc"
    t.text "question_5_b"
    t.text "question_5_b_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insured_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.date "birthdate"
    t.string "mobile_no"
    t.string "email"
    t.string "gender"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_id"
    t.string "moa_no"
    t.date "notarized_date"
    t.date "moa_signed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_moas_on_proposal_id"
  end

  create_table "officers", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffx"
    t.string "birth_day"
    t.string "designation"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suffix"
  end

  create_table "plans", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.bigint "product_line_id"
    t.bigint "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_plans_on_product_category_id"
    t.index ["product_line_id"], name: "index_plans_on_product_line_id"
  end

  create_table "process_coverages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "group_remit_id"
    t.bigint "plan_id"
    t.bigint "agent_id"
    t.date "effectivity"
    t.date "expiry"
    t.string "status"
    t.integer "approved_count"
    t.decimal "approved_total_coverage", precision: 15, scale: 2
    t.decimal "approved_total_prem", precision: 15, scale: 2
    t.integer "denied_count"
    t.decimal "denied_total_coverage", precision: 15, scale: 2
    t.decimal "denied_total_prem", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_process_coverages_on_agent_id"
    t.index ["group_remit_id"], name: "index_process_coverages_on_group_remit_id"
    t.index ["plan_id"], name: "index_process_coverages_on_plan_id"
  end

  create_table "process_remarks", charset: "utf8mb4", force: :cascade do |t|
    t.string "reference_type"
    t.bigint "reference_id"
    t.text "remark"
    t.string "user_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_type", "reference_id"], name: "index_process_remarks_on_reference"
    t.index ["user_type", "user_id"], name: "index_process_remarks_on_user"
  end

  create_table "product_categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_line_id"
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_line_id"], name: "index_product_categories_on_product_line_id"
  end

  create_table "product_lines", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_annivs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "anniv_type_id"
    t.string "mon"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anniv_type_id"], name: "index_proposal_annivs_on_anniv_type_id"
    t.index ["proposal_id"], name: "index_proposal_annivs_on_proposal_id"
  end

  create_table "proposal_contestables", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "contestability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestability_id"], name: "index_proposal_contestables_on_contestability_id"
    t.index ["proposal_id"], name: "index_proposal_contestables_on_proposal_id"
  end

  create_table "proposal_insured_benefits", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_insured_id"
    t.bigint "benefit_id"
    t.decimal "cov_amount", precision: 15, scale: 2
    t.decimal "premium", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_proposal_insured_benefits_on_benefit_id"
    t.index ["proposal_insured_id"], name: "index_proposal_insured_benefits_on_proposal_insured_id"
  end

  create_table "proposal_insured_loadings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_insured_id"
    t.bigint "gyrt_loading_id"
    t.string "name"
    t.decimal "rate", precision: 15, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gyrt_loading_id"], name: "index_proposal_insured_loadings_on_gyrt_loading_id"
    t.index ["proposal_insured_id"], name: "index_proposal_insured_loadings_on_proposal_insured_id"
  end

  create_table "proposal_insureds", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "insured_type_id"
    t.decimal "total_prem", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insured_type_id"], name: "index_proposal_insureds_on_insured_type_id"
    t.index ["proposal_id"], name: "index_proposal_insureds_on_proposal_id"
  end

  create_table "proposal_officers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "officer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["officer_id"], name: "index_proposal_officers_on_officer_id"
    t.index ["proposal_id"], name: "index_proposal_officers_on_proposal_id"
  end

  create_table "proposals", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "cooperative_id"
    t.string "proposal_no"
    t.integer "new_min_age"
    t.integer "new_max_age"
    t.integer "old_min_age"
    t.integer "old_max_age"
    t.integer "ave_age"
    t.integer "member_count"
    t.decimal "total_premium", precision: 10, scale: 2
    t.decimal "coop_sf", precision: 10, scale: 2
    t.decimal "agent_sf", precision: 10, scale: 2
    t.boolean "actuarial_approval"
    t.boolean "agent_approval"
    t.decimal "nel_amount", precision: 10, scale: 2
    t.decimal "nml_amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_proposals_on_cooperative_id"
    t.index ["plan_id"], name: "index_proposals_on_plan_id"
  end

  create_table "rate_tables", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "gyrt_rate_id"
    t.integer "count"
    t.decimal "qx", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gyrt_rate_id"], name: "index_rate_tables_on_gyrt_rate_id"
    t.index ["proposal_id"], name: "index_rate_tables_on_proposal_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "userable_id"
    t.string "userable_type"
    t.boolean "admin", default: false
    t.boolean "approved", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batch_health_decs", "batches"
  add_foreign_key "batch_health_decs", "health_dec_questions"
  add_foreign_key "coop_member_dependents", "coop_members"
end
