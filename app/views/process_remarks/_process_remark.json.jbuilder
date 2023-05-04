json.extract! process_remark, :id, :reference_id, :reference_type, :remark, :user_id, :user_type, :created_at, :updated_at
json.url process_remark_url(process_remark, format: :json)
