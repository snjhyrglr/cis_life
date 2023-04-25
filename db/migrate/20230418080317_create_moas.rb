class CreateMoas < ActiveRecord::Migration[7.0]
  def change
    create_table :moas do |t|
      t.references :proposal#, null: false, foreign_key: true
      t.string :moa_no
      t.date :notarized_date
      t.date :moa_signed_date

      t.timestamps
    end
  end
end
