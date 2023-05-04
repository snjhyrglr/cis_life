class ProcessCoverage < ApplicationRecord
  belongs_to :group_remit
  belongs_to :agent
  belongs_to :plan

  has_many :process_remarks, as: :reference
  accepts_nested_attributes_for :process_remarks

  STATUSES = ['Approved', 'Pending', 'Denied']
end
