class RemoveAnniversaryFromGroupRemit < ActiveRecord::Migration[7.0]
  def change
    remove_reference :group_remits, :anniversary
  end
end
