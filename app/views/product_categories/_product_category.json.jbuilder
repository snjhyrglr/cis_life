json.extract! product_category, :id, :product_line_id, :name, :code, :created_at, :updated_at
json.url product_category_url(product_category, format: :json)
