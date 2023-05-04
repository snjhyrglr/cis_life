class AgentPosition < ApplicationRecord
  belongs_to :agent

  def to_s
    name
  end
end
