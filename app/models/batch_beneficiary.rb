class BatchBeneficiary < ApplicationRecord
  belongs_to :batch
  belongs_to :member_dependent

  def to_s
    self.member_dependent
  end

  def compute_age
    eff = self.batch.effectivity_date
    ben_age = eff.year - self.member_dependent.birthdate.year - ((eff.month > self.member_dependent.birthdate.month || (eff.month == self.member_dependent.birthdate.month && eff.day >= self.member_dependent.birthdate.day)) ? 0 : 1)
    self.update(
      age: ben_age
    )

  end
end
