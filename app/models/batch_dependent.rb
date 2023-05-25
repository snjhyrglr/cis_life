class BatchDependent < ApplicationRecord
  attr_accessor :dependent_type
  belongs_to :batch
  belongs_to :member_dependent
  belongs_to :proposal_insured

  def get_prem
    prem = self.proposal_insured.total_prem
    self.update(
      premium: prem
    )
  end
end
