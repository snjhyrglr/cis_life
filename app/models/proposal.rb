class Proposal < ApplicationRecord
  belongs_to :plan
  belongs_to :cooperative
  
  has_many :proposal_officers
  has_many :officers, through: :proposal_officers
  accepts_nested_attributes_for :officers, reject_if: :all_blank, allow_destroy: true

  has_many :proposal_insureds
  has_many :insured_types, through: :proposal_insureds

  has_one :proposal_anniv
  has_one :anniv_type, through: :proposal_anniv
  accepts_nested_attributes_for :proposal_anniv, reject_if: :all_blank, allow_destroy: true

  has_many :proposal_contestables
  has_many :contestabilities, through: :proposal_contestables
end
