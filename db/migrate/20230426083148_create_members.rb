class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :suffix
      t.date :birthdate
      t.string :mobile_no
      t.string :email
      t.string :gender
      t.string :occupation

      t.timestamps
    end
  end
end
