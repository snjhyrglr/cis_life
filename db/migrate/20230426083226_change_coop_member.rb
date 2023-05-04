class ChangeCoopMember < ActiveRecord::Migration[7.0]
  def change
    # remove_column :coop_members, :last_name
    # remove_column :coop_members, :first_name
    # remove_column :coop_members, :middle_name
    # remove_column :coop_members, :suffix
    # remove_column :coop_members, :birthdate
    # remove_column :coop_members, :mobile_number
    # remove_column :coop_members, :email

    add_reference :coop_members, :member
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
