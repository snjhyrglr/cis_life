class ProposalInsuredBenefit < ApplicationRecord
  belongs_to :proposal_insured
  belongs_to :benefit

  def set_premium(benefit_id)
    case benefit_id
    when 1
      sum_rate = RateTable.joins(:gyrt_rate)..where(proposal_id: proposal_insured.proposal_id, gyrt_rate: { age: 18..65 }).sum(:qx)
      sum_count = RateTable.joins(:gyrt_rate)..where(proposal_id: proposal_insured.proposal_id, gyrt_rate: { age: 18..65 }).sum(:count)

      prem_rate = sum_rate / sum_count
    else
      prem_rate = GyrtRate.find_by(benefit_id: benefit_id, age: proposal_insured.proposal.ave_age).rate
    end

    multiplier = GyrtRateMultiplier.find_by('? between min_count and max_count and ? = benefit_id', proposal_insured.proposal.members_count, benefit_id).rate

    final_prem_rate = prem_rate

    self.premium = case self.benefit_id
    when 1 then (final_prem_rate * (cov_amount / 1000)) # Life Prem
    when 2 then ((cov_amount * (final_prem_rate * 1000)) / 1000) # ADD Prem
    when 3 then (((prem_rate * 1000) * cov_amount) / 1000) #TPD
    end
  end
end
