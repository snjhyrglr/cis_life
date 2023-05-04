class ProposalInsured < ApplicationRecord
  belongs_to :proposal
  belongs_to :insured_type

  has_many :proposal_insured_benefits
  has_many :benefits, through: :proposal_insured_benefits
  accepts_nested_attributes_for :proposal_insured_benefits, reject_if: :all_blank, allow_destroy: true

  def update_total_premium
    self.update(
      total_prem: self.proposal_insured_benefits.sum(:premium)
    )
  end
end
