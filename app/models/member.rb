class Member < ApplicationRecord
  has_many :coop_members
  has_many :cooperative, through: :coop_members
  has_many :coop_branches, through: :coop_members

  def to_s
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.batch_cov_amount(batch_id)
    cov_amount = ProposalInsuredBenefit.joins(proposal_insured: {proposal:  { moa: { group_remit: :batch } } }).where(batches: { id: batch_id}).cov_amount
  end
  
end
