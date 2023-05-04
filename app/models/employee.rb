class Employee < ApplicationRecord
  belongs_to :department
  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  has_many :process_remarks, as: :user
  

  def to_s
    full_name
  end

  def full_name
    "#{first_name} #{last_name}".titleize
    
  end
  
end
