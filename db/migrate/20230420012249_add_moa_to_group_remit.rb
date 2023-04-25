class AddMoaToGroupRemit < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_remits, :moa#, null: false, foreign_key: true
  end
end
