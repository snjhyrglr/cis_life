class BatchRemark < ApplicationRecord
  attr_accessor :batch_status, :process_coverage
  belongs_to :batch, optional: :true
  belongs_to :user, polymorphic: true, optional: true

  validates :text, presence: true

end
