class CreateContestabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :contestabilities do |t|
      t.integer :min_age
      t.integer :max_age
      t.string :member_type
      t.decimal :period, precision: 6, scale: 2
      t.string :period_type

      t.timestamps
    end
  end
end
