class CreateBatchRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_remarks do |t|
      t.references :batch#, null: false, foreign_key: true
      t.string :text
      t.references :user, polymorphic: true#, null: false, foreign_key: true

      t.timestamps
    end
  end
end
