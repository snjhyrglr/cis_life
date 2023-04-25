class CoopMember < ApplicationRecord
  # validates_presence_of :coop_branch_id, :last_name, :first_name, :email
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  belongs_to :cooperative
  belongs_to :coop_branch
  has_many :coop_member_dependents, dependent: :destroy
  has_many :coop_member_beneficiaries, dependent: :destroy
  has_many :batches
  accepts_nested_attributes_for :coop_member_beneficiaries, allow_destroy: true, reject_if: :all_blank  

  def full_name
    "#{first_name} #{last_name}"
  end
end
