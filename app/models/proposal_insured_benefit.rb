class ProposalInsuredBenefit < ApplicationRecord
  belongs_to :proposal_insured
  belongs_to :benefit
end
