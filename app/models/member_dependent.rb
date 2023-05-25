class MemberDependent < ApplicationRecord
  belongs_to :member

  RELATIONSHIPS = ['Parent', 'Spouse', 'Child', 'Sibling']

  def to_s
    mi = "#{middle_name[0]}. " if middle_name
    "#{first_name} #{mi}#{last_name}"
  end
end
