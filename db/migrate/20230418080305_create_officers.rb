class CreateOfficers < ActiveRecord::Migration[7.0]
  def change
    create_table :officers do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :suffx
      t.string :birth_day
      t.string :designation
      t.boolean :active

      t.timestamps
    end
  end
end
