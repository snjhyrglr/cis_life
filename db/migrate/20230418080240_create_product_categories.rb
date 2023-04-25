class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.references :product_line#, null: false, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
