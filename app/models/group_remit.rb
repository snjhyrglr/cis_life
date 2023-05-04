class GroupRemit < ApplicationRecord
  belongs_to :moa
  has_many :batches
  has_many :member, through: :batches

  def to_s
    name
  end
end
