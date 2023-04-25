class CreateBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :benefits do |t|
      t.string :name
      t.string :description
      t.string :short_name

      t.timestamps
    end
  end
end
