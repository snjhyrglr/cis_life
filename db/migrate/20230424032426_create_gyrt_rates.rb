class CreateGyrtRates < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_rates do |t|
      t.references :benefit#, null: false, foreign_key: true
      t.integer :age
      t.decimal :rate, precision: 10, scale: 6

      t.timestamps
    end
  end
end
