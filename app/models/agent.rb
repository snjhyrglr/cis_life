class Agent < ApplicationRecord
  belongs_to :agent_group
  belongs_to :agent_position

  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  has_many :process_remarks, as: :user

  def to_s
    full_name
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
