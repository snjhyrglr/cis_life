class CreateBatchHealthDecs < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_health_decs do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :health_dec_question, null: false, foreign_key: true
      t.decimal :sub_rate
      t.decimal :sub_prem
      t.decimal :sub_coverage
      t.string :status

      t.timestamps
    end
  end
end
