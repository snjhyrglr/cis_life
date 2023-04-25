class ProposalContestable < ApplicationRecord
  belongs_to :proposal
  belongs_to :contestability
end
