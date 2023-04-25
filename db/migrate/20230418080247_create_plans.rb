class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :short_name
      t.references :product_line#, null: false, foreign_key: true
      t.references :product_category#, null: false, foreign_key: true

      t.timestamps
    end
  end
end
