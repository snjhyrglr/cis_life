class AddColumnsToBatch < ActiveRecord::Migration[7.0]
  def change
    add_column :batches, :premium, :decimal, :precision => 15, :scale => 2
    add_column :batches, :status, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
