class RemoveAgreementFromGroupRemit < ActiveRecord::Migration[7.0]
  def change
    remove_reference :group_remits, :agreement
  end
end
