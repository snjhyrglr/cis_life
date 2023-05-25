class ProcessRemark < ApplicationRecord
  attr_accessor :process_status
  belongs_to :reference, polymorphic: true, optional: true
  belongs_to :user, polymorphic: true, optional: true

  validates :remark, presence: true
end
