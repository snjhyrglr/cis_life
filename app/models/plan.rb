class Plan < ApplicationRecord
  belongs_to :product_line
  belongs_to :product_category
end
