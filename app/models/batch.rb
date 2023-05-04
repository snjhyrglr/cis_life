class Batch < ApplicationRecord
  belongs_to :group_remit
  belongs_to :coop_member
  has_one :batch_health_dec
  has_one :health_dec_question, through: :batch_health_dec
end
