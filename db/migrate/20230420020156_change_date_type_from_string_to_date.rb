class ChangeDateTypeFromStringToDate < ActiveRecord::Migration[7.0]
  def change
    change_column :batches, :expiry_date, :date#, :column_options
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
