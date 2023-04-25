class ProposalOfficer < ApplicationRecord
  belongs_to :proposal
  belongs_to :officer
end
