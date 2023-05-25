class CreateBatchDependents < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_dependents do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :member_dependent, null: false, foreign_key: true
      t.decimal :premium

      t.timestamps
    end
  end
end
