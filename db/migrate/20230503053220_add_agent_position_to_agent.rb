class AddAgentPositionToAgent < ActiveRecord::Migration[7.0]
  def change
    add_reference :agents, :agent_position#, null: false, foreign_key: true
  end
end
