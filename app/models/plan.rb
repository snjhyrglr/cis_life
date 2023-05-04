class Plan < ApplicationRecord
  belongs_to :product_line
  belongs_to :product_category

  def to_s
    name
  end
  
end
