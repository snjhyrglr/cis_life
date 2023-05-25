class Batch < ApplicationRecord

  belongs_to :group_remit
  belongs_to :coop_member
  
  belongs_to :member
  scope :coop_member, -> { joins(:member).where('members.coop_member = ?', true) }

  has_one :batch_health_dec
  has_one :health_dec_question, through: :batch_health_dec

  has_many :batch_dependents
  has_many :batch_beneficiaries
  has_many :batch_remarks


  def to_s
    mem_name(self.coop_member_id)
  end

  def mem_name(mem_id)
    self.coop_member.member.full_name
  end

  def urd_update_prem
    coop_sf_rate = self.group_remit.moa.proposal.coop_sf
    agent_sf_rate = self.group_remit.moa.proposal.agent_sf

    self.update(
      coop_sf_amount: self.premium * coop_sf_rate,
      agent_sf_amount: self.premium * agent_sf_rate
    )
  end

 

end
