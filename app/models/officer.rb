class Officer < ApplicationRecord
  has_many :proposal_officers
  has_many :proposals, through: :proposal_officers


  def full_name
    "#{first_name} #{middle_name[0]}. #{last_name}"
  end
end
